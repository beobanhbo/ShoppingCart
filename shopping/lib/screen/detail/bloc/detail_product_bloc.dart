import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/model/product/product_repos.dart';
import 'package:shopping/screen/detail/bloc/detail_product_event.dart';
import 'package:shopping/screen/detail/bloc/detail_product_state.dart';

class DetailProductBloc extends Bloc<DetailProductEvent, DetailProductState> {
  ProductRepos productRepos = ProductRepos();
  @override
  // TODO: implement initialState
  DetailProductState get initialState => DetailProductInit();

  @override
  Stream<DetailProductState> mapEventToState(DetailProductEvent event) async* {
    if (event is DetailProductRequest) {
      yield DetailProductLoading();
      try {
        var loading = await productRepos.getProductItem();
        yield DetailProductSuccess(product: loading);
      } on Exception catch (error) {
        yield DetailProductFailure(error: error.toString());
      }
    }
  }
}
