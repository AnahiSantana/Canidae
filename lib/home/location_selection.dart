import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class LocationSelection extends StatefulWidget {
  LocationSelection({Key key}) : super(key: key);

  @override
  _LocationSelectionState createState() => _LocationSelectionState();
}

class _LocationSelectionState extends State<LocationSelection> {
  GeoPoint _temp = GeoPoint(20.631016724321775, -103.3669197099245);
  LatLng _center = LatLng(20.631033172046234, -103.37998064091526);
  GoogleMapController mapController;
  Position _currentPosition;
  Set<Marker> _mapMarkers = Set();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("Seleccione ubicación")),
        body: GoogleMap(
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
          onTap: (tapped) {
            _addMarker(tapped.latitude, tapped.longitude);
          },
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
                    Navigator.pop(
                        context,
                        GeoPoint(_mapMarkers.elementAt(0).position.latitude,
                            _mapMarkers.elementAt(0).position.longitude));
                  },
                  label: Text("Aceptar"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 35),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pop(context, _temp);
                  },
                  label: Text("Cancelar"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    await _getCurrentPosition();
    _temp = GeoPoint(_currentPosition.latitude, _currentPosition.longitude);
    setState(() {});
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

  _addMarker(double lat, double long) {
    _mapMarkers.add(Marker(
      markerId: MarkerId("00"),
      position: LatLng(lat, long),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
    ));
    setState(() {});
  }
}
