import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:test_canidae_2/login/CanidaeLogin.dart';
import 'package:test_canidae_2/login/CanidaeRegister.dart';

class CanidaeSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: CanidaeRegister(),
      gradientBackground: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.1,
            0.85,
            0.9
          ],
          colors: [
            Color(0xff757575),
            Color(0xffffdede),
            Color(0xffffdede),
          ]),
      image: Image.asset('assets/images/logo.png'),
      photoSize: 220,
      loaderColor: Color(0xff757575),
    );
  }
}
