import 'package:equatable/equatable.dart';
abstract class HomeEvent extends Equatable{
  const HomeEvent();
}

class HomeRequest extends HomeEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class InitialHome extends HomeEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
