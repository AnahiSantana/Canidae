import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_canidae_2/CanidaeSplash.dart';
import 'constants.dart';

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
        theme: ThemeData(
          primaryColor: PRIMARY_COLOR,
          accentColor: ACCENT_COLOR,
          cardColor: SECONDARY_COLOR,
          splashColor: ACCENT_COLOR,
          appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            primary: SECONDARY_ACCENT_COLOR,
            backgroundColor: ACCENT_COLOR,
            shape: StadiumBorder(),
            minimumSize: Size(100, 50),
          )),
          textTheme: TextTheme(
            headline1: TextStyle(
              fontFamily: 'Fira Sans',
              fontSize: 52,
              fontWeight: FontWeight.w400,
              color: SECONDARY_ACCENT_COLOR,
            ),
            headline2: TextStyle(
              fontFamily: 'Fira Sans',
              fontSize: 32,
              color: SECONDARY_ACCENT_COLOR,
              fontWeight: FontWeight.w400,
              height: 0.84375,
            ),
            bodyText1: TextStyle(
                fontFamily: 'Noto Sans',
                fontSize: 16,
                color: Color(0x7d3d3d3d),
                fontWeight: FontWeight.w600),
          ),
        ));
  }
}
