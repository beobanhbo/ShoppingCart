import 'package:flutter/material.dart';
import 'package:shopping/commons/widgets/card/item_card.dart';
import 'package:shopping/model/product/product.dart';

class ListItem extends StatefulWidget {
  final List<Product> list;

  const ListItem({this.list});
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CardItem(
            title: "dwdw",
            assetPath: "",
            callback: null,
          );
        },
      ),
    );
  }
}
