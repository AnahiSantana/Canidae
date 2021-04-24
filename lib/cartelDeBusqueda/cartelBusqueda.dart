import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_canidae_2/gradient.dart';

class CartelBusqueda extends StatefulWidget {
  CartelBusqueda({Key key}) : super(key: key);

  @override
  _CartelBusquedaState createState() => _CartelBusquedaState();
}

//TODO: implementar bloc
class _CartelBusquedaState extends State<CartelBusqueda> {
  File selectedImage;
  DateTime fechaE;
  var noTc = TextEditingController();
  var noAdTc = TextEditingController();
  var correoTc = TextEditingController();
  var petNameTc = TextEditingController();
  var descTc = TextEditingController();

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
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 40),
      child: ListView(
        children: [
          Text(
            'Cartel de busqueda',
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Text(
            "Información de contacto",
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text("Número de telefono"),
          TextField(
            controller: noTc,
            decoration: InputDecoration(
              labelText: 'No de telefono',
              labelStyle: Theme.of(context).textTheme.bodyText1,
              fillColor: Theme.of(context).primaryColor,
              filled: true,
            ),
          ),
          SizedBox(height: 16),
          Text("Número de telefono adicional"),
          TextField(
            controller: noAdTc,
            decoration: InputDecoration(
              labelText: 'No Acicional',
              labelStyle: Theme.of(context).textTheme.bodyText1,
              fillColor: Theme.of(context).primaryColor,
              filled: true,
            ),
          ),
          SizedBox(height: 16),
          Text("Correo"),
          TextField(
            controller: correoTc,
            decoration: InputDecoration(
              labelText: 'Correo',
              labelStyle: Theme.of(context).textTheme.bodyText1,
              fillColor: Theme.of(context).primaryColor,
              filled: true,
            ),
          ),
          SizedBox(height: 30),
          Text(
            "Información de la mascota",
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text("Nombre"),
          TextField(
            controller: petNameTc,
            decoration: InputDecoration(
              labelText: 'Nombre',
              labelStyle: Theme.of(context).textTheme.bodyText1,
              fillColor: Theme.of(context).primaryColor,
              filled: true,
            ),
          ),
          SizedBox(height: 16),
          Text("Descripción"),
          TextField(
            maxLines: 10,
            controller: descTc,
            decoration: InputDecoration(
              fillColor: Theme.of(context).primaryColor,
              filled: true,
            ),
          ),
          SizedBox(height: 16),
          Text("Agregar foto"),
          selectedImage != null
              ? Image.file(
                  selectedImage,
                  fit: BoxFit.contain,
                  height: 60,
                  width: 60,
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Container(
                    height: 160,
                    width: 120,
                    decoration:
                        BoxDecoration(color: Theme.of(context).primaryColor),
                    child: IconButton(
                        color: Theme.of(context).accentColor,
                        iconSize: 35,
                        icon: Icon(Icons.add_a_photo_rounded),
                        onPressed: () {
                          //TODO: Select photo event
                        }),
                  ),
                ),
          SizedBox(height: 16),
          Text("Fecha de extravío"),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 3, 200, 0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  primary: Color(0x7d3d3d3d)),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      fechaE == null
                          ? "Select"
                          : (fechaE.year.toString() +
                              "-" +
                              fechaE.month.toString() +
                              "-" +
                              fechaE.day.toString()),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Expanded(flex: 1, child: Icon(Icons.calendar_today_outlined))
                ],
              ),
              onPressed: () {
                //TODO: change to event
                showDatePicker(
                  context: context,
                  initialDate: fechaE == null ? DateTime.now() : fechaE,
                  firstDate: DateTime(2019),
                  lastDate: DateTime.now(),
                  builder: (BuildContext context, Widget child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        colorScheme: ColorScheme.light(
                            primary: Theme.of(context).primaryColor),
                      ),
                      child: child,
                    );
                  },
                ).then((date) {
                  setState(() {
                    fechaE = date;
                  });
                });
              },
            ),
          ),
          SizedBox(height: 16),
          Text("Lugar de extravío"),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 3, 200, 0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor),
              child: Text(
                "Abrir mapa",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onPressed: () {
                //TODO: implementar maps
              },
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
            child: TextButton(
              child: Text(
                "¡Crear!",
                style: TextStyle(fontSize: 22),
              ),
              onPressed: () {
                //TODO: guardar en firebase
              },
            ),
          ),
        ],
      ),
    );
  }
}
