import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/commons/widgets/carousel/carousel.dart';
import 'package:shopping/commons/widgets/category/category_row.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ImageSlider(),
          CategoryRow(),
        ],
      ),
    );
  }
}
