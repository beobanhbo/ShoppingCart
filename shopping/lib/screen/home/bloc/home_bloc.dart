import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/model/category/category.dart';
import 'package:shopping/model/product/product_repos.dart';
import 'package:shopping/screen/home/bloc/home_event.dart';
import 'package:shopping/screen/home/bloc/home_state.dart';
import 'dart:developer' as developer;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // Call repository
  ProductRepos productRepos;

  HomeBloc({this.productRepos});

  @override
  HomeState get initialState => HomeInit();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    // bind repository
    if (event is HomeRequest) {
      developer.log("dqdqwwdqwd");
      var loading = await productRepos.fetchProduct();

      yield HomeSuccess(listProduct: loading);
      developer.log("dqdqwscaascascwdqwd");

      yield HomeLoading();
      // var loading = await productRepos.fetchProduct();
      // developer.log("HomeSuccess");
      // yield HomeSuccess(listProduct: loading);
      //try catch
      try {
        if (event is HomeRequest) {
          var loading = await productRepos.fetchProduct();
          developer.log("HomeSuccess");
          yield HomeSuccess(listProduct: loading);
          // yield HomeLoading();
          // developer.log("HomeLoading");
         try{
           var loading = await productRepos.fetchProduct();
           developer.log("HomeSuccess");
           yield HomeSuccess(listProduct: loading);
         } on Exception catch(error){
           developer.log("HomeFailure");
           yield HomeFailure(error: error.toString());
         }
        }
      } on Exception catch (error) {
        yield HomeFailure(error: error.toString());
      }
    }
  }
}
