import 'package:flutter/material.dart';

class ListaCarteles extends StatefulWidget {
  ListaCarteles({Key key}) : super(key: key);

  @override
  _ListaCartelesState createState() => _ListaCartelesState();
}

class _ListaCartelesState extends State<ListaCarteles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text("Buscar mascotas perdidas"),
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
                  "Aqui van los ListaCarteles y los filtros de busqueda",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            )
            //TODO: todo xD

            ));
  }
}
