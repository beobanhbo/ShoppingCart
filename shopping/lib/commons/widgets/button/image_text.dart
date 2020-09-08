import 'package:flutter/material.dart';
import 'package:shopping/theme.dart';

class ImageText extends StatelessWidget {
  final String title;
  final Function callback;
  final String assetPath;

  ImageText({Key key, this.title, this.callback, this.assetPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Column(
        children: <Widget>[
          Container(
            child: Image.asset(assetPath),
            height: 50,
            width: 50,
          ),
          Text(
            title,
            style: AppStyle.of(context).defaultTextStyle(),
          ),
        ],
      ),
    );
  }
}
