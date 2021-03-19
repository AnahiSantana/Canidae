import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:test_canidae_2/gradient.dart';
import 'package:test_canidae_2/login/CanidaeRegister.dart';

class CanidaeLogin extends StatelessWidget {
  CanidaeLogin({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: gradientP(),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 75,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
