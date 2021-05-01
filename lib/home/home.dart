import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_canidae_2/home/found/found.dart';
import 'package:test_canidae_2/home/lost/lost.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:async';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleMapController mapController;

  Position _center =
      Position(latitude: 20.631033172046234, longitude: -103.37998064091526);
  Position _currentPosition;
  Set<Marker> _mapMarkers = Set();

  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    await _getCurrentPosition();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(color: Theme.of(context).accentColor),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _currentPosition == null
              ? LatLng(_center.latitude, _center.longitude)
              : LatLng(_currentPosition.latitude, _currentPosition.longitude),
          zoom: 18.0,
        ),
        mapType: MapType.normal,
        markers: _mapMarkers,
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
      ),
    );
  }

  Future<void> _getCurrentPosition() async {
    // verify permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    // get current position
    _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    //final Uint8List marker01 = await _urlToImage("https://dkt6rvnu67rqj.cloudfront.net/cdn/ff/v-u6szPHWKJtwxujfCslo-XnSyTdzbtk6SuWQLOpwfY/1579112217/public/styles/max_1000/public/media/cr_files/callejero.jpg?itok=Whibpx4K");
    // add marker

    //TODO: traer los markers de firebase
    _mapMarkers.add(
      Marker(
        markerId: MarkerId("01"),
        position: LatLng(20.63746147234882, -103.37861690858111),
        icon: await getMarkerIcon(
            ("https://dkt6rvnu67rqj.cloudfront.net/cdn/ff/v-u6szPHWKJtwxujfCslo-XnSyTdzbtk6SuWQLOpwfY/1579112217/public/styles/max_1000/public/media/cr_files/callejero.jpg?itok=Whibpx4K")),
      ),
    );

    _mapMarkers.add(
      Marker(
        markerId: MarkerId("02"),
        position: LatLng(20.638284779547764, -103.38022623393856),
        icon: await getMarkerIcon(
            ("https://image.freepik.com/free-photo/dog-is-sitting-couch-love-tenderness-pets-vertical_120897-1729.jpg")),
      ),
    );

    // move camera
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            _currentPosition.latitude,
            _currentPosition.longitude,
          ),
          zoom: 18.0,
        ),
      ),
    );
  }

  Future<Uint8List> _urlToImage(String url) async {
    //Convertir las imagenes a bitmap para poderlas usar en markers
    final File markerImageFile = await DefaultCacheManager().getSingleFile(url);
    final Uint8List markerImageBytes = await markerImageFile.readAsBytes();

    ui.Codec codec =
        await ui.instantiateImageCodec(markerImageBytes, targetWidth: 200);
    ui.FrameInfo fi = await codec.getNextFrame();

    final Uint8List markerImage =
        (await fi.image.toByteData(format: ui.ImageByteFormat.png))
            .buffer
            .asUint8List();

    return markerImage;
  }

  Future<BitmapDescriptor> getMarkerIcon(String imagePath) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint rectColor = Paint()..color = Theme.of(context).primaryColor;
    final Radius radius = Radius.circular(10);

    // dibujar un rectangulo rosa
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0, 0, 200, 200),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        rectColor);

    //Dibujar pico indicador
    var path = Path();

    path.moveTo(100, 250);
    path.lineTo(25, 100);
    path.lineTo(175, 100);
    path.close();

    canvas.drawPath(path, rectColor);

    // Rectangulo donde irá la imagen
    Rect imgRec = Rect.fromLTWH(10, 10, 180, 180);

    // Agredar el path para la imagaen
    canvas.clipPath(Path()..addRect(imgRec));

    //Decodificar Imagen
    final Completer<ui.Image> completer = new Completer();

    ui.decodeImageFromList(await _urlToImage(imagePath), (ui.Image img) {
      return completer.complete(img);
    });

    // Pintar imagen en el canvas
    ui.Image image = await completer.future;

    paintImage(
        canvas: canvas, image: image, rect: imgRec, fit: BoxFit.fitWidth);

    // Convert canvas to image
    final ui.Image markerAsImage =
        await pictureRecorder.endRecording().toImage(200, 250);

    // Convertir nuestro custom marker a bytes
    final ByteData byteData =
        await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List uint8List = byteData.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(uint8List);
  }
}
