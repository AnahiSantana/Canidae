import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:geopoint/geopoint.dart';

class Carteles extends Equatable {
  final String color;
  final String descripcion;
  final String email;
  final DateTime fechaExtravio;
  final GeoPoint lugar;
  final num noAdicional;
  final num noTelefono;
  final String petName;
  final String tamano;
  final String urlToImage;
  final String idUser;

  const Carteles({
    @required this.petName,
    @required this.descripcion,
    @required this.email,
    @required this.noAdicional,
    @required this.noTelefono,
    @required this.color,
    @required this.tamano,
    @required this.urlToImage,
    @required this.fechaExtravio,
    @required this.lugar,
    @required this.idUser,
  });

  @override
  String toString() {
    return 'Articles(petName: $petName, email: $email, noAdicional: $noAdicional, noTelefono: $noTelefono)';
  }

  factory Carteles.fromJson(Map<String, dynamic> json) {
    return Carteles(
      petName: json['color'] as String,
      descripcion: json['color'] as String,
      email: json['color'] as String,
      noAdicional: json['color'] as num,
      noTelefono: json['color'] as num,
      color: json['color'] as String,
      tamano: json['tamano'] as String,
      urlToImage: json['urlToImage'] as String,
      fechaExtravio: json['fechaExtravio'] == null
          ? null
          : DateTime.parse(json['fechaExtravio'] as String),
      lugar: json['lugar'] as GeoPoint,
      idUser: json['idUser'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'petName': petName,
      'descripcion': descripcion,
      'email': email,
      'noAdicional': noAdicional,
      'noTelefono': noTelefono,
      'color': color,
      'tamano': tamano,
      'urlToImage': urlToImage,
      'fechaExtravio': fechaExtravio?.toIso8601String(),
      'lugar': lugar,
      'idUser': idUser,
    };
  }

  Carteles copyWith({
    String petName,
    String descripcion,
    String email,
    num noAdicional,
    num noTelefono,
    String color,
    String tamano,
    String urlToImage,
    DateTime fechaExtravio,
    String lugar,
    String idUser,
  }) {
    return Carteles(
      petName: petName ?? this.petName,
      descripcion: descripcion ?? this.descripcion,
      email: email ?? this.email,
      noAdicional: noAdicional ?? this.noAdicional,
      noTelefono: noTelefono ?? this.noTelefono,
      color: color ?? this.color,
      tamano: tamano ?? this.tamano,
      urlToImage: urlToImage ?? this.urlToImage,
      fechaExtravio: fechaExtravio ?? this.fechaExtravio,
      lugar: lugar ?? this.lugar,
      idUser: idUser ?? this.idUser,
    );
  }

  @override
  List<Object> get props {
    return [
      petName,
      descripcion,
      email,
      noAdicional,
      noTelefono,
      color,
      tamano,
      urlToImage,
      fechaExtravio,
      lugar,
      idUser,
    ];
  }
}
