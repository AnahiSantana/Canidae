import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_canidae_2/gradient.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_canidae_2/home/location_selection.dart';
import 'package:test_canidae_2/models/carteles.dart';
import 'bloc/cartel_bloc.dart';

class CartelBusqueda extends StatefulWidget {
  CartelBusqueda({Key key}) : super(key: key);

  @override
  _CartelBusquedaState createState() => _CartelBusquedaState();
}

class _CartelBusquedaState extends State<CartelBusqueda> {
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

  CartelBloc cartelBloc;
  DateTime fechaE;
  File selectedImage;
  GeoPoint lugar;
  String colorDropdownValue = 'Negro';
  String sizeDropdownValue = 'Pequeño';
  var noTc = TextEditingController();
  var noAdTc = TextEditingController();
  var correoTc = TextEditingController();
  var petNameTc = TextEditingController();
  var descTc = TextEditingController();
  var tamano = TextEditingController();
  var color = TextEditingController();

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
          child: BlocProvider(
            create: (context) {
              cartelBloc = CartelBloc();
              return cartelBloc;
            },
            child: BlocConsumer<CartelBloc, CartelState>(
              listener: (context, state) {
                if (state is PickedImageState) {
                  selectedImage = state.image;
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text("Imagen seleccionada"),
                      ),
                    );
                } else if (state is SavedCartelState) {
                  noTc.clear();
                  noAdTc.clear();
                  correoTc.clear();
                  petNameTc.clear();
                  descTc.clear();
                  color.clear();
                  tamano.clear();
                  selectedImage = null;
                  fechaE = null;
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text("Cartel guardado..."),
                      ),
                    );
                }
              },
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return _createForm();
              },
            ),
          )),
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
          SizedBox(height: 10),
          TextField(
            controller: noTc,
            decoration: InputDecoration(
              labelText: 'Número de telefono',
              labelStyle: Theme.of(context).textTheme.bodyText1,
              fillColor: Theme.of(context).primaryColor,
              filled: true,
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: noAdTc,
            decoration: InputDecoration(
              labelText: 'Número de telefono adicional',
              labelStyle: Theme.of(context).textTheme.bodyText1,
              fillColor: Theme.of(context).primaryColor,
              filled: true,
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: correoTc,
            decoration: InputDecoration(
              labelText: 'Correo electrónico',
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
          SizedBox(height: 10),
          Row(
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
                    items:
                        colorList.map<DropdownMenuItem<String>>((String value) {
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
                    items:
                        sizeList.map<DropdownMenuItem<String>>((String value) {
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
          TextField(
            controller: petNameTc,
            decoration: InputDecoration(
              labelText: 'Nombre completo',
              labelStyle: Theme.of(context).textTheme.bodyText1,
              fillColor: Theme.of(context).primaryColor,
              filled: true,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Descripción de la mascota",
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
          ),
          TextField(
            maxLines: 10,
            controller: descTc,
            decoration: InputDecoration(
              fillColor: Theme.of(context).primaryColor,
              filled: true,
            ),
          ),
          SizedBox(height: 20),
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
                        onPressed: () async {
                          selectedImage = await _chooseImage();
                        }),
                  ),
                ),
          SizedBox(height: 16),
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
            "Lugar de extravío",
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
              onPressed: () async {
                lugar = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LocationSelection()),
                );
              },
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
            child: TextButton(
              child: Text(
                "Crear reporte",
                style: TextStyle(fontSize: 22),
              ),
              onPressed: () {
                cartelBloc.add(
                  SaveCartelEvent(
                    cartel: Carteles(
                      petName: petNameTc.text,
                      noTelefono: int.parse(noTc.text),
                      noAdicional: int.parse(noAdTc.text),
                      email: correoTc.text,
                      descripcion: descTc.text,
                      tamano: sizeDropdownValue,
                      color: colorDropdownValue,
                      urlToImage: null,
                      idUser: null,
                      fechaExtravio: fechaE,
                      lugar: lugar,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<File> _chooseImage() async {
    File _pickedFile;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        cartelBloc.add(GalleryImageEvent());
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      cartelBloc.add(CamaraImageEvent());
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
    return _pickedFile;
  }
}
