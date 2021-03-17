import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:test_canidae_2/gradient.dart';
import 'package:test_canidae_2/login/CanidaeLogin.dart';

class CanidaeRegister extends StatelessWidget {
  CanidaeRegister({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: gradientP(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '¡Bienvenido!',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 8, 0),
              child: Text(
                'Crea una cuenta para seguir usando las funciones de Canidae',
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GoogleAuthButton(
                    onPressed: () {},
                    darkMode: false,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text("O registrate usando tu correo"),
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
                        labelText: 'Nombre completo',
                        labelStyle: Theme.of(context).textTheme.bodyText1,
                        fillColor: Theme.of(context).primaryColor,
                        filled: true,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
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
                  padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).primaryColor,
                        filled: true,
                        suffixIcon: Icon(Icons.visibility_off_outlined),
                        labelText: 'Contraseña',
                        labelStyle: Theme.of(context).textTheme.bodyText1,
                      ),
                      obscureText: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 24, 25, 16),
                  child: TextButton(
                    style: TextButton.styleFrom(minimumSize: Size(350, 50)),
                    child: Text('Registrarse'),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Text("¿Ya tienes una cuenta? Inicia sesión"),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return CanidaeLogin();
                      }));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
