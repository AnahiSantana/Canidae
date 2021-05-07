import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_canidae_2/home/found/avistamientos/bloc/avistamiento_bloc.dart';
import 'package:test_canidae_2/models/avistamientos.dart';

import 'itemAvistamientos.dart';

class ListaAvistamientos extends StatefulWidget {
  ListaAvistamientos(
      {Key key, color, tamano, urlToImage, lugar, DateTime fechaExtravio})
      : super(key: key);

  @override
  _ListaAvistamientosState createState() => _ListaAvistamientosState();
}

class _ListaAvistamientosState extends State<ListaAvistamientos> {
  AvistamientoBloc avistamientoBloc;
  List<String> filterList = [
    'Negro',
    'Gris',
    'Blanco',
    'Café',
    'Dorado',
    'Rojo',
    'Pequeño',
    'Mediano',
    'Grande',
  ];

  List<String> selectedFiltersList = [];

  void _openFilterDialog(context) async {
    await FilterListDialog.display<String>(
      context,
      listData: filterList,
      selectedListData: selectedFiltersList,
      height: 350,
      borderRadius: 15,

      headlineText: "Filtra por color y tamaño",
      choiceChipLabel: (item) {
        return item;
      },
      validateSelectedItem: (list, val) {
        return list.contains(val);
      },
      width: 550,
      onApplyButtonClick: (list) async {
        List<Avistamientos> items = await getAvistamientos();
        var avistArray = [];
        var filtrArray = [];

        List<Avistamientos> filtered = [];

        items.forEach((avistamiento) {
          list.forEach((filter) {
            if (avistamiento.color.contains(filter) ||
                avistamiento.tamano.contains(filter)) {
              filtered.add(avistamiento);
            }
          });
        });

        list.forEach((filter) {
          items.forEach((avistamiento) {
            if (avistamiento.color
                    .toLowerCase()
                    .contains(filter.toLowerCase()) ||
                avistamiento.tamano
                    .toLowerCase()
                    .contains(filter.toLowerCase())) {
              filtered.add(avistamiento);
            }
          });
        });

        print(filtered);

        AvistamientoBloc avistamientoBloc;

        BlocProvider(
          create: (context) {
            avistamientoBloc = AvistamientoBloc();
            avistamientoBloc
                .add(FilterAllCartelesEvent(avistamientos: filtered));
            return avistamientoBloc;
          },
          child: BlocConsumer<AvistamientoBloc, AvistamientoState>(
            listener: (context, state) {
              if (state is FilteredAvistamientoState) {
                ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: filtered.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemAvistamientos(
                      avistamiento: filtered[index],
                    );
                  },
                );
              }
            },
            builder: (context, state) {
              if (state is LoadedAvistamientoState) {
                return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: filtered.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemAvistamientos(
                      avistamiento: filtered[index],
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        );
      },
      hideSearchField: true,
      hideSelectedTextCount: true,
      hideCloseIcon: true,
      applyButonTextBackgroundColor: Theme.of(context).accentColor,
      selectedChipTextStyle: Theme.of(context).textTheme.headline5,
      unselectedChipTextStyle: Theme.of(context).textTheme.headline5,
      controlButtonTextStyle: TextStyle(color: Colors.white),

      /// uncomment below code to create custom choice chip
      choiceChipBuilder: (context, item, isSelected) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isSelected
                    ? Theme.of(context).accentColor
                    : Theme.of(context).primaryColor,
                border: Border.all(
                  color: isSelected
                      ? Theme.of(context).accentColor
                      : Theme.of(context).primaryColor,
                )),
            child: Text(
              item,
              style: TextStyle(color: isSelected ? Colors.white : Colors.black),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Avistamientos"),
        leading: BackButton(color: Theme.of(context).accentColor),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                _openFilterDialog(context);
              },
              child: Icon(
                Icons.filter_alt,
                size: 32,
                color: Theme.of(context).accentColor,
              ),
            ),
          )
        ],
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
