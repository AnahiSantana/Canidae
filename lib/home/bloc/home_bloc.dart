import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_canidae_2/models/avistamientos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:connectivity/connectivity.dart';



part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _cFirestore = FirebaseFirestore.instance;

  HomeBloc() : super(HomeInitial());
  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is RequestAllMArkersEvent) {
      // conectarnos a firebase noSQL y traernos los docs
      yield LoadingState();
      //1) Revisar el tipo de conexión
      var connection = await (Connectivity().checkConnectivity());

      //2) Si hay conexión guardamos las noticias en hive
      if (connection == ConnectivityResult.wifi ||
          connection == ConnectivityResult.mobile) {
        yield LoadedMarkersState(wachadosList: await _getWachados() ?? []);
      } else {
        yield NoConectionState();
      }
    }
  }

  Future<List<Avistamientos>> _getWachados() async {
    try {
      var avistamientos = await _cFirestore.collection("Avistamientos").get();
      return avistamientos.docs
          .map(
            (element) => Avistamientos(
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

}
