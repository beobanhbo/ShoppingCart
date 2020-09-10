import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/commons/utils/app_images.dart';
import 'package:shopping/commons/widgets/carousel/carousel.dart';
import 'package:shopping/commons/widgets/category/category_row.dart';
import 'package:shopping/model/product/product.dart';
import 'package:shopping/model/product/product_repos.dart';
import 'package:shopping/screen/home/bloc/home_bloc.dart';
import 'package:shopping/screen/home/bloc/home_event.dart';
import 'package:shopping/screen/home/bloc/home_state.dart';
import 'package:shopping/screen/home/category_list.dart';
import 'package:shopping/screen/routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc()..add(HomeRequest()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ImageSlider(),
            CategoryRow(),
            Container(
                height: 400, width: double.infinity, child: CategoryList()),
          ],
        ),
      ),
    );
  }
}
