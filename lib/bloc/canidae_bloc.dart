import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_canidae_2/users/user_respository.dart';

part 'canidae_event.dart';
part 'canidae_state.dart';

class CanidaeBloc extends Bloc<CanidaeEvent, CanidaeState> {
  CanidaeBloc({UserRepository userRepository}) : super(CanidaeInitial());
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Stream<CanidaeState> mapEventToState(
    CanidaeEvent event,
  ) async* {
    if (event is AppInitEvent) {
      yield* _appInitEventHelper();
    } else if (event is LoginEvent) {
      yield* _loginEventHelper();
    } else if (event is LogoutEvent) {
      yield* _logoutEventHelper();
    }
  }
}

Stream<CanidaeState> _appInitEventHelper() async* {
  try {
    final isSignedIn = await UserRepository().isSignedIn();
    if (isSignedIn) {
      final name = await UserRepository().getUser();
      yield LoggedInState(name);
    } else {
      yield LoggedOutState();
    }
  } catch (_) {
    yield LoggedOutState();
  }
}

Stream<CanidaeState> _loginEventHelper() async* {
  yield LoggedInState(await UserRepository().getUser());
}

Stream<CanidaeState> _logoutEventHelper() async* {
  yield LoggedOutState();
  UserRepository().signOut();
}
