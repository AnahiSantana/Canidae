import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_canidae_2/CanidaeSplash.dart';
import 'package:test_canidae_2/login/CanidaeLogin.dart';

import 'login/CanidaeLogin.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: CanidaeSplash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
