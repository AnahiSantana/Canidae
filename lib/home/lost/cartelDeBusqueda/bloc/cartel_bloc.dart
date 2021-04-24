import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cartel_event.dart';
part 'cartel_state.dart';

class CartelBloc extends Bloc<CartelEvent, CartelState> {
  CartelBloc() : super(CartelInitial());

  @override
  Stream<CartelState> mapEventToState(
    CartelEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
