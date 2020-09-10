import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/screen/category/bloc/grid_category_bloc.dart';
import 'package:shopping/screen/category/bloc/grid_category_state.dart';

class GridCategory extends StatefulWidget {

  @override
  _GridCategoryState createState() => _GridCategoryState();
}

class _GridCategoryState extends State<GridCategory> {
  GridCategoryBloc gridCategoryBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh:  Future<void>_onRefresh(),
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

 Future<void>_onRefresh() async {
   _reloadCategoryList();
}

void _reloadCategoryList() {

}
