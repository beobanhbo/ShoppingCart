import 'package:equatable/equatable.dart';
import 'package:shopping/model/product/product.dart';

abstract class DetailProductState extends Equatable {
  const DetailProductState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DetailProductInit extends DetailProductState {}

class DetailProductLoading extends DetailProductState {}

class DetailProductSuccess extends DetailProductState {
  final Product product;

  DetailProductSuccess({this.product});
}

class DetailProductFailure extends DetailProductState {
  final String error;

  DetailProductFailure({this.error});
  @override
  String toString() {
    // TODO: implement toString
    return "DetailProductFailure: $error";
  }
}
