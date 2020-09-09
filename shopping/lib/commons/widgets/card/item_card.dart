import 'package:flutter/material.dart';
import 'package:shopping/commons/widgets/button/image_text.dart';

class CardItem extends StatelessWidget {
  final String title;
  final Function callback;
  final String assetPath;

  const CardItem({Key key, this.title, this.callback, this.assetPath})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ImageText(title: title, assetPath: assetPath, callback: null),
    );
  }
}
