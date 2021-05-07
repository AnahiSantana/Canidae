import 'package:flutter/material.dart';
import 'package:test_canidae_2/home/lost/cartelDeBusqueda/cartelBusqueda.dart';
import 'package:test_canidae_2/home/lost/catalogoAvistamientos/lista-avistamientos.dart';

class Perdido extends StatefulWidget {
  Perdido({Key key}) : super(key: key);

  @override
  _PerdidoState createState() => _PerdidoState();
}

class _PerdidoState extends State<Perdido> {
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
              '¿Perdiste a tu mascota?',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(
              "Nosotros te ayudamos a encontrarla",
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/images/missing.png'),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
              child: TextButton(
                child: Text(
                  "Crear un reporte 🧾",
                  style: TextStyle(fontSize: 22),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return CartelBusqueda();
                  }));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: TextButton(
                child: Text(
                  "Buscar avistamientos 🔎",
                  style: TextStyle(fontSize: 22),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Avistamientos();
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
