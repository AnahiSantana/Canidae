part of 'cartel_bloc.dart';

abstract class CartelState extends Equatable {
  const CartelState();

  @override
  List<Object> get props => [];
}

class CartelInitial extends CartelState {}

class LoadingState extends CartelState {}

class LoadedCartelState extends CartelState {
  final List<Carteles> carteles;

  LoadedCartelState({@required this.carteles});
  @override
  List<Object> get props => [carteles];
}

class PickedImageState extends CartelState {
  final File image;

  PickedImageState({@required this.image});
  @override
  List<Object> get props => [image];
}

class SavedCartelState extends CartelState {
  List<Object> get props => [];
}

class ErrorMessageState extends CartelState {
  final String errorMsg;

  ErrorMessageState({@required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
