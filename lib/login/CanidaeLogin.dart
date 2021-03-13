import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:auth_buttons/auth_buttons.dart';
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
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0,
                0.85,
                1
              ],
              colors: [
                Color(0xff757575),
                Color(0xffffdede),
                Color(0xffffdede),
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 75,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '¡Te extrañamos!',
                style: TextStyle(
                  fontFamily: 'Fira Sans',
                  fontSize: 52,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 8, 0),
              child: Text(
                'Inicia sesión',
                style: TextStyle(
                  fontFamily: 'Fira Sans',
                  fontSize: 32,
                  color: const Color(0xffffffff),
                  height: 0.84375,
                ),
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
                      color: Color(0xffffdede),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Correo',
                        labelStyle: TextStyle(
                            fontFamily: 'Noto Sans',
                            fontSize: 16,
                            color: Color(0x7d3d3d3d),
                            fontWeight: FontWeight.w600),
                        fillColor: Color(0xffffdede),
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
                        fillColor: Color(0xffffdede),
                        filled: true,
                        suffixIcon: Icon(Icons.visibility_off_outlined),
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(
                            fontFamily: 'Noto Sans',
                            fontSize: 16,
                            color: Color(0x7d3d3d3d),
                            fontWeight: FontWeight.w600),
                      ),
                      obscureText: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 24, 25, 16),
                  child: FlatButton(
                    height: 50,
                    minWidth: 350,
                    shape: StadiumBorder(),
                    color: Color(0xfffc3465),
                    textColor: Colors.white,
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
                  child: Text("¿Aún no tienes una cuenta? Crea una cuenta"),
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

login() {}
