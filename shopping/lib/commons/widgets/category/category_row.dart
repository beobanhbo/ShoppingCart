import 'package:flutter/material.dart';
import 'package:shopping/commons/widgets/button/image_text.dart';

class CategoryRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: _buildRowItem(),
    );
  }

  Widget _buildRowItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ImageText(
            title: 'All',
            assetPath: 'assets/images/family.png',
            callback: null),
        ImageText(
            title: 'Men',
            assetPath: 'assets/images/person.png',
            callback: null),
        ImageText(
            title: 'Woman',
            assetPath: 'assets/images/woman.png',
            callback: null),
        ImageText(
            title: 'Kid', assetPath: 'assets/images/baby.png', callback: null),
      ],
    );
  }
}
