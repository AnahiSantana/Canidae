import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_canidae_2/CanidaeSplash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_canidae_2/home/home.dart';
import 'package:test_canidae_2/login/CanidaeLogin.dart';
import 'package:firebase_core/firebase_core.dart';

import 'bloc/auth_bloc.dart';
import 'constants.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BlocProvider(
    create: (context) => AuthBloc()..add(VerifyAuthenticationEvent()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Caniadae',
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AlreadyAuthState) return Home();
          if (state is UnAuthState) return CanidaeLogin();
          return CanidaeSplash();
        },
      ),
      theme: ThemeData(
        primaryColor: PRIMARY_COLOR,
        accentColor: ACCENT_COLOR,
        cardColor: PRIMARY_COLOR,
        backgroundColor: SECONDARY_COLOR,
        highlightColor: PRIMARY_COLOR,
        splashColor: ACCENT_COLOR,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: Theme.of(context).textTheme.bodyText1,
          fillColor: Theme.of(context).primaryColor,
          filled: true,
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
          headline3: TextStyle(
            fontFamily: 'Fira Sans',
            fontSize: 20,
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
      ),
    );
  }
}
