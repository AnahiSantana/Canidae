import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:test_canidae_2/gradient.dart';
import 'package:test_canidae_2/login/CanidaeRegister.dart';

class CanidaeSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: CanidaeRegister(),
      gradientBackground: gradientP(),
      image: Image.asset('assets/images/logo.png'),
      photoSize: 220,
      loaderColor: Color(0xff757575),
    );
  }
}
