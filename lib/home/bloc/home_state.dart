part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class LoadingState extends HomeState {}

class NoConectionState extends HomeState {}

class LoadedMarkersState extends HomeState {
  final List<Avistamientos> wachadosList;

  LoadedMarkersState({@required this.wachadosList});
  @override
  List<Object> get props => [wachadosList];
}

class ErrorMessageState extends HomeState {
  final String errorMsg;

  ErrorMessageState({@required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
