import 'package:flutter/material.dart';
import 'package:test_canidae_2/home/found/catalogoCarteles/lista-carteles.dart';

import 'avistamientos/avistamiento.dart';

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
            Text(
              '¿Encontraste una mascota?',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "¡Ayudala a volver a casa!",
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/images/found1.png'),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
              child: TextButton(
                child: Text(
                  "Registrar un avistamiento 🔭",
                  style: TextStyle(fontSize: 22),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Avistamiento();
                  }));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: TextButton(
                child: Text(
                  "Buscar reportes 🔎",
                  style: TextStyle(fontSize: 22),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ListaCarteles();
                  }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
