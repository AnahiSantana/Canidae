import 'package:flutter/material.dart';
import 'constants.dart';

LinearGradient gradientP() {
  return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [
        0,
        0.80,
        1
      ],
      colors: [
        SECONDARY_COLOR,
        PRIMARY_COLOR,
        PRIMARY_COLOR,
      ]);
}
