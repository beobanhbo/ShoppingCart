import 'package:flutter/material.dart';
import 'package:shopping/screen/home/home_screen.dart';
import 'package:shopping/screen/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Routes routes = Routes();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      initialRoute: Routes.initial,
      onGenerateRoute: routes.routePage,
    );
  }
}
