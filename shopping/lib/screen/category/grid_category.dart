import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/screen/category/bloc/grid_category_bloc.dart';
import 'package:shopping/screen/category/bloc/grid_category_event.dart';
import 'package:shopping/screen/category/bloc/grid_category_state.dart';
import 'package:shopping/screen/home/bloc/home_event.dart';

class GridCategory extends StatefulWidget {

  @override
  _GridCategoryState createState() => _GridCategoryState();
}

class _GridCategoryState extends State<GridCategory> {
  GridCategoryBloc gridCategoryBloc;
  Completer<void> _refreshCompleter= Completer();
  ScrollController _scrollController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    gridCategoryBloc = BlocProvider.of<GridCategoryBloc>(context);
    gridCategoryBloc.add(GridCategoryRequest());
  }

  Future<void>_onRefresh() async {
    gridCategoryBloc.add(GridCategoryReload());
    gridCategoryBloc.add(GridCategoryRequest());
    return _refreshCompleter.future;
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh:  _onRefresh,
      child: BlocBuilder<GridCategoryBloc, GridCategoryState>(
        builder: (context, state) {
          if (state is GridCategorySuccess) {
            return GridView.builder(
                itemCount: state.list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      color: Colors.grey,
                      child: Image.network(
                          '${state.list[index].image}'.toString()),
                    ),
                  );
                });
          } else if (state is GridCategoryFailure) {
            return Center(
              child: Text("${state.error}"),
            );
          } else if (state is GridCategoryLoading) {
            return Center(
              child: Text("Loading"),
            );
          }
          return Center(
            child: Text("dwdw"),
          );
        },
      ),
    );
  }

 
}

