import 'package:flutter/material.dart';
import 'package:shopping/screen/detail/detail_product.dart';
import 'package:shopping/screen/home/home_screen.dart';

class Routes {
  static const String initial = "/";
  static const String Home = "/home";
  static const String Detail = "/detail";
  MaterialPageRoute routePage(RouteSettings settings) {
    return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          switch (settings.name) {
            case Home:
              return HomeScreen();
            case Detail:
              return DetailProduct();
            default:
              return Container();
          }
        });
  }
}
