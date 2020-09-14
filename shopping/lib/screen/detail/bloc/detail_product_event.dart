import 'package:equatable/equatable.dart';

abstract class DetailProductEvent extends Equatable {
  const DetailProductEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DetailProductRequest extends DetailProductEvent {}

class DetailProductReload extends DetailProductEvent {}
