import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/screen/category/bloc/grid_category_bloc.dart';
import 'package:shopping/screen/category/bloc/grid_category_event.dart';

import 'bloc/grid_category_state.dart';
import 'grid_category.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
//  bool _isRefreshList = true;
//
//  GridCategoryBloc gridCategoryBloc;
//  Completer<void> _refreshCompleter = Completer();
//  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _scrollController = ScrollController();
//    gridCategoryBloc = BlocProvider.of<GridCategoryBloc>(context);
//    gridCategoryBloc.add(GridCategoryRequest());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridCategory(),
      ),
    );
  }
}
