import 'package:flutter/material.dart';

class Avistamientos extends StatefulWidget {
  Avistamientos({Key key}) : super(key: key);

  @override
  _AvistamientosState createState() => _AvistamientosState();
}

class _AvistamientosState extends State<Avistamientos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text("Buscar avistamientos"),
          leading: BackButton(color: Theme.of(context).accentColor),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Container(
            color: Theme.of(context).backgroundColor,
            width: double.infinity,
            height: double.infinity,
            child: ListView(
              children: [
                Text(
                  "Aqui van los avistamientos y los filtros de busqueda",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            )
            //TODO: todo xD

            ));
  }
}
