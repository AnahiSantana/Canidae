import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:test_canidae_2/bloc/auth_bloc.dart';
import 'package:test_canidae_2/gradient.dart';
import 'package:test_canidae_2/auth/user_auth_provider.dart';
import 'package:test_canidae_2/login/CanidaeLogin.dart';
import 'package:test_canidae_2/login/bloc/login_bloc.dart';

class Perfil extends StatefulWidget {
  Perfil({Key key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final _cFirebase = FirebaseAuth.instance;
  LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(color: Theme.of(context).accentColor),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: gradientP(),
        ),
        child: _createForm(),
      ),
    );
  }

  Widget _createForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
      child: ListView(
        children: [
          Text(
            _cFirebase.currentUser.displayName,
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).accentColor, width: 3),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(_cFirebase.currentUser.photoURL ??
                      "https://i.stack.imgur.com/34AD2.jpg"),
                  fit: BoxFit.contain),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 120.0,
                    width: 120,
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Theme.of(context).accentColor.withOpacity(0.1),
                          blurRadius: 5,
                          offset: Offset(10, 10),
                        ),
                      ],
                    ),
                    child: RaisedButton.icon(
                      label: Text(
                        "Encontrados",
                        style: TextStyle(fontSize: 12),
                        softWrap: true,
                      ),
                      icon: Icon(Icons.visibility_outlined),
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side:
                              BorderSide(color: Theme.of(context).accentColor)),
                      onPressed: () {},
                      padding: EdgeInsets.all(10.0),
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 120.0,
                    width: 120,
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Theme.of(context).accentColor.withOpacity(0.1),
                          blurRadius: 5,
                          offset: Offset(10, 10),
                        ),
                      ],
                    ),
                    child: RaisedButton.icon(
                      label: Text(
                        "Reportes",
                        style: TextStyle(fontSize: 16),
                        softWrap: true,
                      ),
                      icon: Icon(Icons.sticky_note_2_outlined),
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side:
                              BorderSide(color: Theme.of(context).accentColor)),
                      onPressed: () {},
                      padding: EdgeInsets.all(10.0),
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 200.0,
            width: 120,
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Theme.of(context).accentColor,
                  blurRadius: 5,
                ),
              ],
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 15),
                Text(
                  'Información de contacto',
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Icon(Icons.mail_outline),
                    ),
                    Text(
                      _cFirebase.currentUser.email ?? "Usuario invitado",
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Icon(Icons.phone),
                    ),
                    Text(
                      '3601-4291',
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Icon(Icons.phone_android_outlined),
                    ),
                    Text(
                      '(+52) 3201-4291',
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 50.0,
            width: 120,
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Theme.of(context).accentColor.withOpacity(0.1),
                  blurRadius: 5,
                  offset: Offset(10, 10),
                ),
              ],
            ),
            child: RaisedButton.icon(
              label: Text(
                "Cerrar sesión",
                style: TextStyle(fontSize: 16),
                softWrap: true,
              ),
              icon: Icon(Icons.exit_to_app_outlined),
              elevation: 15,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Theme.of(context).accentColor)),
              onPressed: () {
                AuthBloc()..add(SignOutAuthenticationEvent());
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CanidaeLogin();
                }));
              },
              padding: EdgeInsets.all(10.0),
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
