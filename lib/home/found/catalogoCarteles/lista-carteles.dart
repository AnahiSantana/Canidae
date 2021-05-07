import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_canidae_2/home/found/catalogoCarteles/itemCarteles.dart';
import 'package:test_canidae_2/home/lost/cartelDeBusqueda/bloc/cartel_bloc.dart';
import 'package:test_canidae_2/models/carteles.dart';

class ListaCarteles extends StatefulWidget {
  ListaCarteles({Key key}) : super(key: key);

  @override
  _ListaCartelesState createState() => _ListaCartelesState();
}

class _ListaCartelesState extends State<ListaCarteles> {
  CartelBloc cartelBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Mascotas perdidas"),
        leading: BackButton(color: Theme.of(context).accentColor),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: BlocProvider(
          create: (context) => CartelBloc()..add(RequestAllCartelesEvent()),
          child: BlocConsumer<CartelBloc, CartelState>(
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
              if (state is LoadedCartelState) {
                return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<CartelBloc>(context)
                        .add(RequestAllCartelesEvent());
                    return getCarteles();
                  },
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: state.carteles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemCarteles(
                        cartel: state.carteles[index],
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

Future<List<Carteles>> getCarteles() async {
  try {
    var carteles =
        await FirebaseFirestore.instance.collection("Carteles").get();
    return carteles.docs
        .map(
          (element) => Carteles(
              petName: element["petName"],
              descripcion: element["descripcion"],
              email: element["email"],
              noAdicional: element["noAdicional"],
              noTelefono: element["noTelefono"],
              color: element["color"],
              tamano: element["tamano"],
              urlToImage: element["urlToImage"],
              lugar: element["lugar"],
              fechaExtravio: DateTime.parse(element["fechaExtravio"]),
              idUser: element["idUser"]),
        )
        .toList();
  } catch (e) {
    print("Error: $e");
    return [];
  }
}
