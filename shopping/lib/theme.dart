import 'package:flutter/material.dart';

class AppStyle {
  ThemeData themeData;

  AppStyle({@required this.themeData});
  factory AppStyle.of(BuildContext context) {
    return AppStyle(themeData: Theme.of(context));
  }
  TextStyle defaultTextStyle() {
    return themeData.textTheme.bodyText2.copyWith(color: Colors.black);
  }
}
