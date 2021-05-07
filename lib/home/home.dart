import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_canidae_2/home/bloc/home_bloc.dart';
import 'package:test_canidae_2/home/found/avistamientos/avistamiento.dart';
import 'package:test_canidae_2/home/found/found.dart';
import 'package:test_canidae_2/home/lost/lost.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:test_canidae_2/models/avistamientos.dart';

import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:async';

import 'package:test_canidae_2/profile/profile.dart';

import 'lost/catalogoAvistamientos/DetalleAvistamiento.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeBloc homeBloc;
  GoogleMapController mapController;

  LatLng _center = LatLng(20.631033172046234, -103.37998064091526);
  Position _currentPosition;
  Set<Marker> _mapMarkers = Set();

  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    await _getCurrentPosition();
    setState(() {});
  }

  @override
  void initState() {
    HomeBloc()..add(RequestAllMArkersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.replay),
              onPressed: () {
                homeBloc.add(RequestAllMArkersEvent());
              }),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Theme.of(context).accentColor,
              size: 32,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Perfil();
              }));
            },
          )
        ],
      ),
      body: BlocProvider(
        create: (context) {
          homeBloc = HomeBloc();
          homeBloc.add(RequestAllMArkersEvent());
          return homeBloc;
        },
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is ErrorMessageState) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text("${state.errorMsg}"),
                  ),
                );
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NoConectionState) {
              return Center(
                child: Column(
                  children: [
                    Text("No internet conection"),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            } else if (state is LoadedMarkersState) {
              return _displayMap(state.wachadosList);
            }
            return Text("Algo salio mal");
          },
        ),
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 35),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Perdido();
                  }));
                },
                label: Text("  Perdida   "),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Avistamiento();
                  }));
                },
                child: Icon(Icons.camera_alt),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 0),
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

  _displayMap(List<Avistamientos> listaAvistamientos) {
    listaAvistamientos.forEach(
      (e) async {
        _mapMarkers.add(
          Marker(
              markerId: MarkerId(e.urlToImage),
              position: LatLng(e.lugar.latitude, e.lugar.longitude),
              icon: await getMarkerIcon(e.urlToImage),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetalleAvistamiento(avistamiento: e),
                  ),
                );
              }),
        );
      },
    );

    return GoogleMap(
      onMapCreated: _onMapCreated,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: false,
      initialCameraPosition: CameraPosition(
        target: _currentPosition == null
            ? _center
            : LatLng(_currentPosition.latitude, _currentPosition.longitude),
        zoom: 18.0,
      ),
      mapType: MapType.normal,
      markers: _mapMarkers,
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
    final Radius radius = Radius.circular(15);

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
