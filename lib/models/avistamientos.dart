import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:geopoint/geopoint.dart';

class Avistamientos extends Equatable {
  final String color;
  final DateTime fecha;
  final GeoPoint lugar;
  final String tamano;
  final String urlToImage;

  const Avistamientos({
    @required this.color,
    @required this.tamano,
    @required this.lugar,
    @required this.urlToImage,
    @required this.fecha,
  });

  @override
  String toString() {
    return 'Articles(color: $color, tamano: $tamano, urlToImage: $urlToImage, fecha: $fecha, lugar: $lugar)';
  }

  factory Avistamientos.fromJson(Map<String, dynamic> json) {
    return Avistamientos(
      color: json['color'] as String,
      tamano: json['tamano'] as String,
      urlToImage: json['urlToImage'] as String,
      fecha: json['fecha'] == null
          ? null
          : DateTime.parse(json['fecha'] as String),
      lugar: json['lugar'] as GeoPoint,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'tamano': tamano,
      'urlToImage': urlToImage,
      'fecha': fecha?.toIso8601String(),
      'lugar': lugar,
    };
  }

  Avistamientos copyWith({
    String color,
    String tamano,
    String urlToImage,
    DateTime fecha,
    String lugar,
  }) {
    return Avistamientos(
      color: color ?? this.color,
      tamano: tamano ?? this.tamano,
      urlToImage: urlToImage ?? this.urlToImage,
      fecha: fecha ?? this.fecha,
      lugar: lugar ?? this.lugar,
    );
  }

  @override
  List<Object> get props {
    return [
      color,
      tamano,
      urlToImage,
      fecha,
      lugar,
    ];
  }
}
