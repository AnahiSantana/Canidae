import 'package:flutter/material.dart';

class Encontrado extends StatefulWidget {
  Encontrado({Key key}) : super(key: key);

  @override
  _EncontradoState createState() => _EncontradoState();
}

class _EncontradoState extends State<Encontrado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(color: Theme.of(context).accentColor),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            SizedBox(height: 80),
            Text(
              '¿Encontraste una mascota?',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 80),
            Text(
              "¡Ayudala a volver a casa!",
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
              child: TextButton(
                child: Text(
                  "Registrar un avistamiento",
                  style: TextStyle(fontSize: 22),
                ),
                onPressed: () {
                  //TODO: avistamiento
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: TextButton(
                child: Text(
                  "Buscar reportes",
                  style: TextStyle(fontSize: 22),
                ),
                onPressed: () {
                  //TODO: lista de carteles
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
