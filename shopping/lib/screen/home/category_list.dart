import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/commons/utils/app_images.dart';
import 'package:shopping/model/product/product.dart';
import 'package:shopping/screen/home/bloc/home_bloc.dart';
import 'package:shopping/screen/home/bloc/home_event.dart';
import 'package:shopping/screen/home/bloc/home_state.dart';

import '../routes.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            print("$state state");
            if (state is HomeSuccess) {
              var currentState = state;
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: currentState.listProduct.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
//                        Text(currentState.listCategory[index].type),
                          _buildListCategory(currentState.listProduct),
                        ],
                      ),
                    );
                  });
            } else if (state is HomeFailure) {
              return Center(child: Text('${state.error}'));
            }
            if (state is HomeLoading) {
              return Center(child: Text('Center'));
            }
            if (state is HomeInit) {
              return Center(child: Text('Center HomeInit'));
            }
            return Center(child: Text('$state'));
          },
        ),
      ),
    );
  }

  Widget _buildListCategory(List<Product> list) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.25,
            child: GestureDetector(
                onTap: () async {
                  await Navigator.of(context).pushNamed(Routes.Detail);
                },
                child: Card(child: _buildDetailCard(list, index))),
          );
        },
      ),
    );
  }
}

Widget _buildDetailCard(List<Product> cate, int i) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 50,
                width: 20,
                child: Image.asset(
                  AppAssets.icBag,
                  height: 50,
                  width: 20,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Text(
                "Bag",
                maxLines: 2,
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
