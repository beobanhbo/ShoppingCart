import 'package:shopping/model/product/product.dart';
import 'package:equatable/equatable.dart';
abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInit extends HomeState  {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomeSuccess extends HomeState {
  final List<Product> listProduct;

  HomeSuccess({this.listProduct});

  @override
  // TODO: implement props
  List<Object> get props => [listProduct];
}

class HomeFailure extends HomeState {
  final String error;

  HomeFailure({this.error});
  @override
  String toString() {
    return 'HomeFailure: {$error}';
  }

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
