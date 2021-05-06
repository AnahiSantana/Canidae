import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_canidae_2/home/found/avistamientos/bloc/avistamiento_bloc.dart';

import 'itemAvistamientos.dart';

class Avistamientos extends StatefulWidget {
  Avistamientos(
      {Key key, color, tamano, urlToImage, lugar, DateTime fechaExtravio})
      : super(key: key);

  @override
  _AvistamientosState createState() => _AvistamientosState();
}

class _AvistamientosState extends State<Avistamientos> {
  AvistamientoBloc avistamientoBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Avistamientos"),
        leading: BackButton(color: Theme.of(context).accentColor),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: BlocProvider(
          create: (context) =>
              AvistamientoBloc()..add(RequestAllCartelesEvent()),
          child: BlocConsumer<AvistamientoBloc, AvistamientoState>(
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
              if (state is LoadedAvistamientoState) {
                return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<AvistamientoBloc>(context)
                        .add(RequestAllCartelesEvent());
                    return getAvistamientos();
                  },
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: state.avistamientos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemAvistamientos(
                        avistamiento: state.avistamientos[index],
                      );
                    },
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

Future<List<Avistamientos>> getAvistamientos() async {
  try {
    var avistamientos =
        await FirebaseFirestore.instance.collection("Avistamientos").get();
    return avistamientos.docs
        .map(
          (element) => Avistamientos(
            color: element["color"],
            tamano: element["tamano"],
            urlToImage: element["urlToImage"],
            lugar: element["lugar"],
            fechaExtravio: DateTime.parse(element["fechaExtravio"]),
          ),
        )
        .toList();
  } catch (e) {
    print("Error: $e");
    return [];
  }
}
