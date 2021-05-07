part of 'avistamiento_bloc.dart';

abstract class AvistEvent extends Equatable {
  const AvistEvent();

  @override
  List<Object> get props => [];
}

class RequestAllCartelesEvent extends AvistEvent {
  @override
  List<Object> get props => [];
}

class SaveAvistEvent extends AvistEvent {
  final Avistamientos avistamiento;
  SaveAvistEvent({@required this.avistamiento});

  @override
  List<Object> get props => [avistamiento];
}

class CamaraImageEvent extends AvistEvent {
  @override
  List<Object> get props => [];
}

class GalleryImageEvent extends AvistEvent {
  @override
  List<Object> get props => [];
}
