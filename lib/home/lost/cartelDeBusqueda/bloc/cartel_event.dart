part of 'cartel_bloc.dart';

abstract class CartelEvent extends Equatable {
  const CartelEvent();

  @override
  List<Object> get props => [];
}

class SaveCartelEvent extends CartelEvent {
  final Carteles cartel;
  SaveCartelEvent({@required this.cartel});

  @override
  List<Object> get props => [cartel];
}

class CamaraImageEvent extends CartelEvent {
  @override
  List<Object> get props => [];
}

class GalleryImageEvent extends CartelEvent {
  @override
  List<Object> get props => [];
}
