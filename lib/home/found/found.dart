import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_canidae_2/home/found/catalogoCarteles/itemCarteles.dart';
import 'package:test_canidae_2/home/found/catalogoCarteles/lista-carteles.dart';
import 'package:test_canidae_2/models/carteles.dart';

import 'avistamientos/avistamiento.dart';

class Encontrado extends StatefulWidget {
  Encontrado({Key key}) : super(key: key);

  @override
  _EncontradoState createState() => _EncontradoState();
}

class _EncontradoState extends State<Encontrado> {
  var carteljson = {
    "color": "negro",
    "descripcion": "Un husky muy jugetón",
    "email": "example@ex.com",
    "fechaExtravio": "2021-04-18T23:01:15.963634",
    "isUser": "12345",
    "lugar": "[20.638504632491287° N, 103.37691624804455° W]",
    "noAdicional": 3333000001,
    "noTelefono": 3333000000,
    "petName": "Thor",
    "tamaño": "grande",
    "urlToImage":
        "https://static.vecteezy.com/system/resources/previews/000/716/926/large_2x/bright-eyed-husky-grey-and-white-photo.jpg"
  };

  final cartel = Carteles(
    petName: "Thor",
    descripcion: "Un husky muy jugetón",
    email: "example@ex.com",
    noAdicional: 3333000001,
    noTelefono: 3333000000,
    color: "negro",
    tamano: "grande",
    urlToImage:
        "https://static.vecteezy.com/system/resources/previews/000/716/926/large_2x/bright-eyed-husky-grey-and-white-photo.jpg",
    fechaExtravio: DateTime(2021, 9, 7, 17, 30),
    lugar: GeoPoint(20.638504632491287, 103.37691624804455),
    idUser: "12345",
  );

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
