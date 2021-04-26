import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_canidae_2/CanidaeSplash.dart';
import 'constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_canidae_2/bloc/canidae_bloc.dart';
import 'package:test_canidae_2/users/user_respository.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserRepository _userRepository = UserRepository();
  CanidaeBloc _canidaeBloc;

  @override
  void initState() {
    super.initState();

    _canidaeBloc = CanidaeBloc(userRepository: _userRepository);
    _canidaeBloc.add(AppInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CanidaeBloc(),
        child: MaterialApp(
            title: 'Material App',
            home: BlocBuilder<CanidaeBloc, CanidaeState>(
              bloc: _canidaeBloc,
              builder: (BuildContext context, CanidaeState state) {
                return CanidaeSplash();
              },
            ),
            debugShowCheckedModeBanner: false,
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
            )));
  }
}
