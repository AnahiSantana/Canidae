part of 'avistamiento_bloc.dart';

abstract class AvistamientoState extends Equatable {
  const AvistamientoState();

  @override
  List<Object> get props => [];
}

class AvistInitial extends AvistamientoState {}

class LoadingState extends AvistamientoState {}

class FilteredAvistamientoState extends AvistamientoState {
  final List<Avistamientos> avistamientos;

  FilteredAvistamientoState({@required this.avistamientos});
  @override
  List<Object> get props => [avistamientos];
}

class LoadedAvistamientoState extends AvistamientoState {
  final List<Avistamientos> avistamientos;

  LoadedAvistamientoState({@required this.avistamientos});
  @override
  List<Object> get props => [avistamientos];
}

class PickedImageState extends AvistamientoState {
  final File image;

  PickedImageState({@required this.image});
  @override
  List<Object> get props => [image];
}

class SavedAvistamientoState extends AvistamientoState {
  List<Object> get props => [];
}

class ErrorMessageState extends AvistamientoState {
  final String errorMsg;

  ErrorMessageState({@required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
