import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/model/product/product_repos.dart';
import 'package:shopping/screen/category/bloc/grid_category_bloc.dart';
import 'package:shopping/screen/category/grid_category.dart';

import 'package:shopping/screen/home/bloc/home_bloc.dart';
import 'package:shopping/screen/home/home_screen.dart';
import 'package:shopping/screen/routes.dart';
import 'package:shopping/screen/stepcount/step_screen.dart';
import 'dart:developer';

import 'screen/category/category_screen.dart';
import 'screen/flutter_health_screen.dart';

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
//      home: BlocProvider(
//        create: (context) => GridCategoryBloc(),
//        child: CategoryScreen(),
//      ),
//      initialRoute: Routes.initial,
//      onGenerateRoute: routes.routePage,
      home: FlutterHealthScreen(),
    );
  }
}
