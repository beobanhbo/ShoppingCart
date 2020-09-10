import 'package:equatable/equatable.dart';

abstract class GridCategoryEvent extends Equatable {
  const GridCategoryEvent();
  @override
  List<Object> get props => [];
}

class GridCategoryRequest extends GridCategoryEvent {}

class GridCategoryReload extends GridCategoryEvent {}
