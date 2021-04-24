import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_canidae_2/home/found/found.dart';
import 'package:test_canidae_2/home/lost/lost.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: BackButton(color: Theme.of(context).accentColor),
        ),
        //TODO: corregir mapa, no se carga bien :(
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          mapType: MapType.normal,
        ),
        floatingActionButton: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Perdido();
                    }));
                  },
                  label: Text(" Perdida  "),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                onPressed: () {
                  //TODO: foto para avistamiento
                },
                child: Icon(Icons.camera_alt),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 40),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Encontrado();
                    }));
                  },
                  label: Text("Encontrada"),
                ),
              ),
            ),
          ],
        ));
  }
}
