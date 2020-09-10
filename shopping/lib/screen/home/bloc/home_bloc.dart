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

  @override
  HomeState get initialState => HomeInit();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    //try catch
    final currentState = state;

    try {
      if (currentState is HomeInit) {
        yield HomeLoading();
      } else if (currentState is HomeLoading) {
        yield HomeSuccess();
      }
      if (event is HomeRequest) {
//        yield HomeLoading();
//        developer.log("HomeLoading");
//        var loading = await productRepos.fetchProduct1();
//        print("${loading.length} dwdwdwdw");
//
//        yield HomeSuccess(listProduct: loading);

        developer.log("HomeSuccess");
      }
    } on Exception catch (error) {
      yield HomeFailure(error: error.toString());
    }
  }
}
