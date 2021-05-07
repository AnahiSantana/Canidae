import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_canidae_2/home/lost/catalogoAvistamientos/DetalleAvistamiento.dart';
import 'package:test_canidae_2/models/avistamientos.dart';

class ItemAvistamientos extends StatelessWidget {
  final Avistamientos avistamiento;
  const ItemAvistamientos({Key key, @required this.avistamiento})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    DetalleAvistamiento(avistamiento: avistamiento),
              ),
            );
          },
          child: Card(
            color: Theme.of(context).primaryColor,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                    child: Image.network(
                      "${avistamiento.urlToImage}",
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
                          "Visto en ${avistamiento.fechaExtravio}",
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 16),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.body1,
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  child: Icon(
                                    Icons.square_foot_outlined,
                                    size: 16,
                                  ),
                                ),
                              ),
                              TextSpan(
                                  text:
                                      "${avistamiento.tamano ?? "Descripcion no disponible"}"),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.body1,
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  child: Icon(
                                    Icons.palette,
                                    size: 16,
                                  ),
                                ),
                              ),
                              TextSpan(
                                  text:
                                      "${avistamiento.color ?? "Descripcion no disponible"}"),
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
      ),
    );
  }
}
