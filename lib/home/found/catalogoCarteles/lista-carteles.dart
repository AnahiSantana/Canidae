import 'package:flutter/material.dart';

class Carteles extends StatefulWidget {
  Carteles({Key key}) : super(key: key);

  @override
  _CartelesState createState() => _CartelesState();
}

class _CartelesState extends State<Carteles> {
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
                  "Aqui van los CARTELES y los filtros de busqueda",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            )
            //TODO: todo xD

            ));
  }
}
