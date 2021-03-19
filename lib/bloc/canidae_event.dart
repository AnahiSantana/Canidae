part of 'canidae_bloc.dart';

abstract class CanidaeEvent extends Equatable {
  const CanidaeEvent();

  @override
  List<Object> get props => [];
}

class AppInitEvent extends CanidaeEvent {
  @override
  String toString() => 'Se inició la aplicación';
}

abstract class LoginEvent extends CanidaeEvent {
  final String name;

  LoginEvent(this.name);

  @override
  String toString() => 'Loggeado { name: $name }';
}

abstract class LogoutEvent extends CanidaeEvent {
  @override
  String toString() => 'Se terminó la sesión';
}
