import 'package:flutter/cupertino.dart';
import 'package:fit_kit/fit_kit.dart';
import 'package:flutter/material.dart';

class StepCount extends StatefulWidget {
  @override
  _StepCountState createState() => _StepCountState();
}

class _StepCountState extends State<StepCount> {
  String result = '';
  Map<DataType, List<FitData>> results = Map();
  bool permissions;
  List<DateTime> _dates = List<DateTime>();
  DateTime get _dateFrom => DateTime.now().subtract(Duration(days: 5));
  DateTime get _dateTo => DateTime.now();

  RangeValues _dateRange = RangeValues(1, 8);

  double _limitRange = 0;

  int get _limit => _limitRange == 0.0 ? null : _limitRange.round();

  @override
  void initState() {
    super.initState();

    hasPermissions();
  }

  Future<void> read() async {
    results.clear();

    try {
      permissions = await FitKit.requestPermissions(DataType.values);
      if (!permissions) {
        result = 'requestPermissions: failed';
      } else {
        try {
          results[DataType.STEP_COUNT] = await FitKit.read(
            DataType.STEP_COUNT,
            dateFrom: _dateFrom,
            dateTo: _dateTo,
          );
        } on UnsupportedException catch (e) {
          results[e.dataType] = [];
        }

        result = 'readAll: success';
      }
    } catch (e) {
      result = 'readAll: $e';
    }

    setState(() {});
  }

  Future<void> revokePermissions() async {
    results.clear();

    try {
      await FitKit.revokePermissions();
      permissions = await FitKit.hasPermissions(DataType.values);
      result = 'revokePermissions: success';
    } catch (e) {
      result = 'revokePermissions: $e';
    }

    setState(() {});
  }

  Future<void> hasPermissions() async {
    try {
      permissions = await FitKit.hasPermissions(DataType.values);
    } catch (e) {
      result = 'hasPermissions: $e';
    }

    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final items =
        results.entries.expand((entry) => [entry.key, ...entry.value]).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FitKit Example'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              Text(
                  'Date Range: ${_dateToString(_dateFrom)} - ${_dateToString(_dateTo)}'),
              Text('Permissions: $permissions'),
              Text('Result: $result'),
//              _buildDateSlider(context),
//              _buildLimitSlider(context),
              _buildButtons(context),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    if (item is DataType) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          '$item - ${results[item].length}',
                          style: Theme.of(context).textTheme.title,
                        ),
                      );
                    } else if (item is FitData) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        child: Text(
                          '$item',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      );
                    }

                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _dateToString(DateTime dateTime) {
    if (dateTime == null) {
      return 'null';
    }
    return '${dateTime.day}.${dateTime.month}.${dateTime.year}';
  }

  Widget _buildDateSlider(BuildContext context) {
    return Row(
      children: [
        Text('Date Range'),
        Expanded(
          child: RangeSlider(
            values: _dateRange,
            min: 0,
            max: 9,
            divisions: 10,
            onChanged: (values) => setState(() => _dateRange = values),
          ),
        ),
      ],
    );
  }

  Widget _buildLimitSlider(BuildContext context) {
    return Row(
      children: [
        Text('Limit'),
        Expanded(
          child: Slider(
            value: _limitRange,
            min: 0,
            max: 4,
            divisions: 4,
            onChanged: (newValue) => setState(() => _limitRange = newValue),
          ),
        ),
      ],
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FlatButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            onPressed: () => read(),
            child: Text('Get Step'),
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
        Expanded(
          child: FlatButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            onPressed: () => revokePermissions(),
            child: Text('Revoke permissions'),
          ),
        ),
      ],
    );
  }
}

/*Future<void> countStep() async {
    try {
      permissionsStepCount = await FitKit.hasPermissions(DataType.values);
      if (!permissionsStepCount) {
        result = 'requestPermissions: failed';
      } else {
        try {
          results[DataType.STEP_COUNT] = await FitKit.read(
            DataType.STEP_COUNT,
            dateFrom: DateTime.now().subtract(Duration(days: 5)),
            dateTo: DateTime.now(),
          );
        } on UnsupportedException catch (e) {
          // thrown in case e.dataType is unsupported
          result = 'STEP_COUNT: $e';
        }
      }
    } on UnsupportedException catch (e) {
      // thrown in case e.dataType is unsupported
    }
  }*/
