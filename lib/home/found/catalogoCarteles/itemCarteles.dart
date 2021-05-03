import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_canidae_2/models/carteles.dart';

class ItemCarteles extends StatelessWidget {
  final Carteles cartel;
  const ItemCarteles({Key key, @required this.cartel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: Card(
          color: Theme.of(context).primaryColor,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Image.network(
                    "${cartel.urlToImage}",
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${cartel.petName}",
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Se perdió el ${cartel.fechaExtravio}",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "${cartel.descripcion ?? "Descripcion no disponible"}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 16),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.body1,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Icon(
                                  Icons.phone,
                                  size: 16,
                                ),
                              ),
                            ),
                            TextSpan(
                                text:
                                    "${cartel.noTelefono ?? "Descripcion no disponible"}"),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.body1,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Icon(
                                  Icons.email_outlined,
                                  size: 16,
                                ),
                              ),
                            ),
                            TextSpan(
                                text:
                                    "${cartel.email ?? "Descripcion no disponible"}"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
