import 'package:flutter/material.dart';

class Avistamiento extends StatefulWidget {
  Avistamiento({Key key}) : super(key: key);

  @override
  _AvistamientoState createState() => _AvistamientoState();
}

class _AvistamientoState extends State<Avistamiento> {
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
                  "Aqui va el formulario de avistamiento",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            )
            //TODO: falta todo

            ));
  }
}
