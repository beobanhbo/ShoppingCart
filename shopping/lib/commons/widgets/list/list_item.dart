import 'package:flutter/material.dart';
import 'package:shopping/commons/widgets/card/item_card.dart';

class ListItem extends StatefulWidget {
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            child: CardItem(),
          );
        });
  }
}
