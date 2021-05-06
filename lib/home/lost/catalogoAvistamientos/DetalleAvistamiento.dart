import 'package:flutter/material.dart';
import 'package:test_canidae_2/gradient.dart';
import 'package:test_canidae_2/models/avistamientos.dart';
import 'package:url_launcher/url_launcher.dart';

class DetalleAvistamiento extends StatelessWidget {
  final Avistamientos avistamiento;

  const DetalleAvistamiento({Key key, @required this.avistamiento})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AVISTAMIENTO"),
        leading: BackButton(color: Theme.of(context).accentColor),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: gradientP(),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 50, 36, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    (avistamiento.urlToImage == null ||
                            avistamiento.urlToImage == "")
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/test-image.png',
                              fit: BoxFit.fitWidth,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Image.network(
                              avistamiento.urlToImage,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 15),
                        Text(
                          'Visto por última vez',
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 20, 0),
                              child: Icon(Icons.calendar_today),
                            ),
                            Text(
                              "${avistamiento.fechaExtravio}",
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        SizedBox(height: 5),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 40.0,
                      width: 500,
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color:
                                Theme.of(context).accentColor.withOpacity(0.1),
                            blurRadius: 5,
                            offset: Offset(10, 10),
                          ),
                        ],
                      ),
                      child: RaisedButton.icon(
                        label: Text(
                          "Abrir en Google Maps",
                          style: TextStyle(fontSize: 12),
                          softWrap: true,
                        ),
                        icon: Icon(Icons.explore),
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(
                                color: Theme.of(context).accentColor)),
                        onPressed: () {
                          _launchMapsUrl(avistamiento.lugar.latitude,
                              avistamiento.lugar.longitude);
                        },
                        padding: EdgeInsets.all(10.0),
                        color: Theme.of(context).accentColor,
                        textColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchMapsUrl(double lat, double lon) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
