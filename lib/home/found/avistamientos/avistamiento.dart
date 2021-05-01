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
            'Avistamiento',
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Text(
            "Pon aquí las fotos de la mascota",
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                child: Tags(
              key: _globalKey,
              itemCount: tags.length,
              columns: 4,
              textField: TagsTextField(
                  hintText: "Áyudanos a describirlo",
                  textStyle: TextStyle(fontSize: 14),
                  onSubmitted: (string) {
                    setState(() {
                      tags.add(Item(title: string));
                    });
                  }),
              itemBuilder: (index) {
                final Item currentItem = tags[index];
                return ItemTags(
                  activeColor: Theme.of(context).accentColor,
                  index: index,
                  title: currentItem.title,
                  customData: currentItem.customData,
                  textStyle: TextStyle(fontSize: 14),
                  onPressed: (i) => print(i),
                  onLongPressed: (i) => print(i),
                  removeButton: ItemTagsRemoveButton(
                      color: Colors.white,
                      onRemoved: () {
                        setState(() {
                          tags.removeAt(index);
                        });
                        return true;
                      }),
                );
              },
            )),
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
