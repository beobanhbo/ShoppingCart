import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:healthhub/healthhub.dart';
import 'package:device_apps/device_apps.dart';
import 'package:store_redirect/store_redirect.dart';

class FlutterHealthScreen extends StatefulWidget {
  @override
  _FlutterHealthScreenState createState() => _FlutterHealthScreenState();
}

class _FlutterHealthScreenState extends State<FlutterHealthScreen>
    with WidgetsBindingObserver {
  Timer timer;
  var _healthKitOutput;
  var _healthDataList = List<HealthDataPoint>();
  bool _isAuthorized = false;

  // bool
  bool _isInstalled = false;
  bool _isGoToGooglePlay = false;
  bool _isRunning = false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      checkInstalledGoogleFit();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    checkInstalledGoogleFit();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    DateTime startDate = DateTime.utc(2020, 09, 11);
    DateTime endDate = DateTime.now();

    Future.delayed(Duration(seconds: 0), () async {
      _isAuthorized = await Healthhub.requestAuthorization();

      if (_isAuthorized) {
        print('Authorized');

        List<HealthDataType> types = [
          HealthDataType.STEPS,
        ];

        for (HealthDataType type in types) {
          /// Calls to 'Health.getHealthDataFromType'
          /// must be wrapped in a try catch block.b
          try {
            List<HealthDataPoint> healthData =
                await Healthhub.getHealthDataFromType(startDate, endDate, type);
            _healthDataList.addAll(healthData);
            Map<dynamic, int> map;
            for (HealthDataPoint healthDataPoints in _healthDataList) {
              map.f(healthDataPoints.dateTo, () => healthDataPoints.value);
            }
            print(map);
          } catch (exception) {
            print(exception.toString());
          }
        }

        /// Print the results
//        for (var x in _healthDataList) {
//          print("Data point: $x");
//        }

        /// Update the UI to display the results
        setState(() {});
      } else {
        print('Not authorized');
      }
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  ///////////////
  Future<void> checkInstalledGoogleFit() async {
    print('checkInstalledGoogleFit ');
    // check if installed
    if (await DeviceApps.isAppInstalled('com.google.android.apps.fitness') ==
        true) {
      print('Google Fit: Installed');
      // sync to your email
      if (_isRunning == false) {
        timer = Timer.periodic(Duration(seconds: 1), (timer) {
          initPlatformState();
        });
      }
      _isRunning = !_isRunning;
    } else {
      //
      _isInstalled = false;
      print('Open Google Play');
      _buildAlertDialog();
    }
  }

  _installGoogleFit() {
    _isGoToGooglePlay = true;
    Navigator.of(context).pop();
    StoreRedirect.redirect(androidAppId: 'com.google.android.apps.fitness');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.sync),
              onPressed: () {
                initPlatformState();
              },
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: FlatButton(
                color: Colors.blue,
                child: Text(
                  "Check Google Fit",
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: _healthDataList.isEmpty
                  ? Text("null")
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _healthDataList.length,
                          itemBuilder: (_, index) => ListTile(
                                title: Text(
                                    "${_healthDataList[index].dataType.toString()}: ${_healthDataList[index].value.toString()}"),
                                trailing:
                                    Text('${_healthDataList[index].unit}'),
                                subtitle: Text(
                                    '${DateTime.fromMillisecondsSinceEpoch(_healthDataList[index].dateFrom)} - ${DateTime.fromMillisecondsSinceEpoch(_healthDataList[index].dateTo)}'),
                              )),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  _buildAlertDialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Confirm"),
              content:
                  Text("You need to install Google Fit to go to next step!"),
              actions: <Widget>[
                FlatButton(
                  onPressed: _installGoogleFit,
                  child: Text("OK"),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
              ],
            ));
  }
}
