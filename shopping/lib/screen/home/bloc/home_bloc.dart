import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/model/category/category.dart';
import 'package:shopping/model/product/product_repos.dart';
import 'package:shopping/screen/home/bloc/home_event.dart';
import 'package:shopping/screen/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // Call repository
  ProductRepos productRepos;
  @override
  HomeState get initialState => HomeInit();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    // bind repository
    if (event is HomeRequest) {
      yield HomeLoading();
      //try catch
      try {
        if (event is HomeRequest) {
          yield HomeLoading();
          var loading = await productRepos.fetchProduct();
          yield HomeSuccess(listProduct: loading);
        }
      } on Exception catch (error) {
        yield HomeFailure(error: error.toString());
      }
    }
  }
}
