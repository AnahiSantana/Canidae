import 'package:flutter/material.dart';
import 'package:test_canidae_2/gradient.dart';

class CartelBusqueda extends StatefulWidget {
  CartelBusqueda({Key key}) : super(key: key);

  @override
  _CartelBusquedaState createState() => _CartelBusquedaState();
}

class _CartelBusquedaState extends State<CartelBusqueda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: BackButton(color: Theme.of(context).accentColor),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: gradientP(),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Text(
                    'Cartel de busqueda',
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                  Text("lllllllllllllllllllllllllllllllllllllllllllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllllllllllllllllllllllllllllllllllllllll111"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllllllllllllllllllllllllllllllllllllllll111"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllllllllllllllllllllllllllllllllllllllll111"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllllllllllllllllllllllllllllllllllllllll111"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllllllllllllllllllllllllllllllllllllllll111"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllllllllllllllllllllllllllllllllllllllll111"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllllllllllllllllllllllllllllllllllllllll111"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllllllllllllllllllllllllllllllllllllllll111"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllllllllllllllllllllllllllllllllllllllll111"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllllllllllllllllllllllllllllllllllllllll111"),
                  Text("lllllllllll"),
                  Text("lllllllllllllllllllllllllllllllllllllllllllllll111"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllllllllllllllllllllllllllllllllllllllll111"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllllllllllllllllllllllllllllllllllllllll111"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllllllllllllllllllllllllllllllllllllllll111"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllll"),
                  Text("lllllllllllllllllllllllllllllllllllllllllllllll111"),
                ],
              ),
            ),
          ),
        ));
  }
}
