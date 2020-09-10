import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping/model/product/product.dart';

abstract class GridCategoryState extends Equatable {
  const GridCategoryState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GridCategoryInit extends GridCategoryState {}

class GridCategoryLoading extends GridCategoryState {}

class GridCategorySuccess extends GridCategoryState {
  final List<Product> list;
  GridCategorySuccess({@required this.list});
}

class GridCategoryFailure extends GridCategoryState {
  final String error;
  GridCategoryFailure({this.error});
  @override
  String toString() {
    // TODO: implement toString
    return "GridCategoryFailure: $error";
  }
}
