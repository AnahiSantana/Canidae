part of 'cartel_bloc.dart';

abstract class CartelState extends Equatable {
  const CartelState();
  
  @override
  List<Object> get props => [];
}

class CartelInitial extends CartelState {}
