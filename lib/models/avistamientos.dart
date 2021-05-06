import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Avistamientos extends Equatable {
  final String color;
  final DateTime fechaExtravio;
  final GeoPoint lugar;
  final String tamano;
  final String urlToImage;
  final String idUser;

  const Avistamientos({
    @required this.color,
    @required this.tamano,
    @required this.lugar,
    @required this.urlToImage,
    @required this.fechaExtravio,
    @required this.idUser,
  });

  @override
  String toString() {
    return 'Articles(color: $color, tamano: $tamano, urlToImage: $urlToImage, fechaExtravio: $fechaExtravio, lugar: $lugar)';
  }

  factory Avistamientos.fromJson(Map<String, dynamic> json) {
    return Avistamientos(
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
      'color': color,
      'tamano': tamano,
      'urlToImage': urlToImage,
      'fechaExtravio': fechaExtravio?.toIso8601String(),
      'lugar': lugar,
      'idUser': idUser,
    };
  }

  Avistamientos copyWith({
    String color,
    String tamano,
    String urlToImage,
    DateTime fechaExtravio,
    String lugar,
    String idUser,
  }) {
    return Avistamientos(
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
      color,
      tamano,
      urlToImage,
      fechaExtravio,
      lugar,
      idUser,
    ];
  }
}
