part of 'canidae_bloc.dart';

abstract class CanidaeState extends Equatable {
  const CanidaeState();

  @override
  List<Object> get props => [];
}

class CanidaeInitial extends CanidaeState {}

class InitState extends CanidaeState {
  @override
  String toString() => 'Init state';
}

class LoggedInState extends CanidaeState {
  final String name;

  LoggedInState(this.name);

  @override
  String toString() => 'Loggeado { name: $name }';
}

class LoggedOutState extends CanidaeState {
  @override
  String toString() => 'Logged out state';
}
