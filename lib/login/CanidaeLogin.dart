import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_canidae_2/bloc/auth_bloc.dart';
import 'package:test_canidae_2/gradient.dart';
import 'package:test_canidae_2/login/CanidaeRegister.dart';
import 'package:test_canidae_2/login/bloc/login_bloc.dart';

class CanidaeLogin extends StatefulWidget {
  CanidaeLogin({Key key}) : super(key: key);

  @override
  _CanidaeLoginState createState() => _CanidaeLoginState();
}

class _CanidaeLoginState extends State<CanidaeLogin> {
  LoginBloc loginBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: gradientP(),
        ),
        child: BlocProvider(
          create: (context) {
            loginBloc = LoginBloc();
            return loginBloc;
          },
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginErrorState) {
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      content: Text("${state.error}"),
                      actions: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"),
                        )
                      ],
                    );
                  },
                );
              } else if (state is LoginLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LoginSuccessState) {
                BlocProvider.of<AuthBloc>(context)
                    .add(VerifyAuthenticationEvent());
              }
            },
            builder: (context, state) {
              return _createForm();
            },
          ),
        ),
      ),
    );
  }

  Widget _createForm() {
    return ListView(
      children: [
        SizedBox(
          height: 55,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '¡Te extrañamos!',
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 8, 8, 0),
          child: Text(
            'Inicia sesión',
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GoogleAuthButton(
                //TODO: auth con google
                onPressed: () {
                  loginBloc.add(LoginWithGoogleEvent());
                },
                darkMode: false,
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
              child: Text("O usa tu correo"),
            )
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 3, 25, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Correo',
                    labelStyle: Theme.of(context).textTheme.bodyText1,
                    fillColor: Theme.of(context).primaryColor,
                    filled: true,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 36, 25, 0),
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    suffixIcon: Icon(Icons.visibility_off_outlined),
                    labelText: 'Contraseña',
                    labelStyle: Theme.of(context).textTheme.bodyText1,
                    fillColor: Theme.of(context).primaryColor,
                  ),
                  obscureText: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 24, 25, 16),
              child: TextButton(
                style: TextButton.styleFrom(minimumSize: Size(350, 50)),
                child: Text(
                  'Iniciar sesión',
                ),
                onPressed: () {},
                //TODO: uath con correo
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Olvidé mi contraseña 😫"),
            ),
            InkWell(
              child: Text("¿Aún no tienes una cuenta?"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CanidaeRegister();
                }));
              },
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: InkWell(
                  child: Text("Ingresar como invitado"),
                  onTap: () {
                    loginBloc.add(LoginAnonymousEvent());
                  } //TODO: anonimo

                  ),
            ),
          ],
        ),
      ],
    );
  }
}
