import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/model/product/product.dart';
import 'package:shopping/model/product/product_repos.dart';
import 'package:shopping/screen/category/bloc/grid_category_event.dart';
import 'package:shopping/screen/category/bloc/grid_category_state.dart';

class GridCategoryBloc extends Bloc<GridCategoryEvent, GridCategoryState> {
  ProductRepos productRepos = ProductRepos();
  @override
  // TODO: implement initialState
  GridCategoryState get initialState => GridCategoryInit();

  @override
  Stream<GridCategoryState> mapEventToState(GridCategoryEvent event) async* {
    // TODO: implement mapEventToState

    final currentState = state;
    if (currentState is GridCategoryInit) {
      yield GridCategoryLoading();
    }
    //reload
    if (event is GridCategoryReload) {
      yield GridCategoryInit();
      return;
    }

    if (event is GridCategoryRequest) {
      yield GridCategoryLoading();
      try {
        List<Product> loading = await productRepos.fetchProduct();
        yield GridCategorySuccess(list: loading);
      } on Exception catch (error) {
        yield GridCategoryFailure(error: error.toString());
      }
    }
  }
}
