import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:test_canidae_2/gradient.dart';

class Avistamiento extends StatefulWidget {
  Avistamiento({Key key}) : super(key: key);

  @override
  _AvistamientoState createState() => _AvistamientoState();
}

class _AvistamientoState extends State<Avistamiento> {
  File selectedImage;
  DateTime fechaE;
  final GlobalKey<TagsState> _globalKey = GlobalKey<TagsState>();
  List tags = new List();
  String colorDropdownValue = 'Negro';
  String sizeDropdownValue = 'Pequeño';

  final List<String> colorList = <String>[
    'Negro',
    'Gris',
    'Blanco',
    'Café',
    'Dorado',
    'Rojo'
  ];

  final List<String> sizeList = <String>[
    'Pequeño',
    'Mediano',
    'Grande',
  ];

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
            'Avistamiento',
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Text(
            "¡Ayuda a un amigo a volver a casa!",
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          selectedImage != null
              ? Image.file(
                  selectedImage,
                  fit: BoxFit.contain,
                  height: 60,
                  width: 60,
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Color"),
                      DropdownButton(
                        value: colorDropdownValue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        iconSize: 8,
                        elevation: 16,
                        style: const TextStyle(color: Colors.pinkAccent),
                        onChanged: (String newValue) {
                          setState(() {
                            colorDropdownValue = newValue;
                          });
                        },
                        items: colorList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Tamaño"),
                      DropdownButton(
                        value: sizeDropdownValue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        iconSize: 8,
                        elevation: 16,
                        style: const TextStyle(color: Colors.pinkAccent),
                        onChanged: (String newValue) {
                          setState(() {
                            sizeDropdownValue = newValue;
                          });
                        },
                        items: sizeList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Text(
            "Fecha de extravío",
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(75, 16, 75, 0),
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
          Text(
            "Lugar de avistamiento",
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(75, 16, 75, 0),
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
                "¡Listo!",
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
