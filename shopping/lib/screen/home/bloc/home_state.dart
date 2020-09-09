import 'package:shopping/model/product/product.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInit extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<Product> listProduct;

  HomeSuccess({this.listProduct});
}

class HomeFailure extends HomeState {
  final String error;

  HomeFailure({this.error});
  @override
  String toString() {
    return 'HomeFailure: {$error}';
  }
}
