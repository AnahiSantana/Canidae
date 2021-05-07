import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_canidae_2/models/avistamientos.dart';
//import 'package:connectivity/connectivity.dart';

part 'avistamiento_event.dart';
part 'avistamiento_state.dart';

class AvistamientoBloc extends Bloc<AvistEvent, AvistamientoState> {
  final _cFirestore = FirebaseFirestore.instance;
  final _cFirebase = FirebaseAuth.instance;
  File _selectedPicture;

  AvistamientoBloc() : super(AvistInitial());

  @override
  Stream<AvistamientoState> mapEventToState(
    AvistEvent event,
  ) async* {
    if (event is RequestAllCartelesEvent) {
      // conectarnos a firebase noSQL y traernos los docs
      yield LoadingState();
      yield LoadedAvistamientoState(
          avistamientos: await _getAvistamientos() ?? []);
    } else if (event is GalleryImageEvent) {
      yield LoadingState();
      _selectedPicture = await _imgFromGallery();
      yield PickedImageState(image: _selectedPicture);
    } else if (event is CamaraImageEvent) {
      yield LoadingState();
      _selectedPicture = await _imgFromCamera();
      yield PickedImageState(image: _selectedPicture);
    } else if (event is SaveAvistEvent) {
      String imageUrl = await _uploadFile();
      if (imageUrl != null) {
        yield LoadingState();
        await _saveCartel(
          event.avistamiento.copyWith(
            urlToImage: imageUrl,
            idUser: _cFirebase.currentUser.uid,
          ),
        );
        // yield LoadedNewsState(noticiasList: await _getNoticias() ?? []);
        yield SavedAvistamientoState();
      } else {
        yield ErrorMessageState(errorMsg: "No se pudo guardar la imagen");
      }
    }
  }

  Future<bool> _saveCartel(Avistamientos avistamientos) async {
    try {
      await _cFirestore.collection("Avistamientos").add(avistamientos.toJson());
      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  Future<String> _uploadFile() async {
    try {
      var stamp = DateTime.now();
      if (_selectedPicture == null) return null;
      // define upload task
      UploadTask task = FirebaseStorage.instance
          .ref("images/imagen_$stamp.png")
          .putFile(_selectedPicture);
      // execute task
      await task;
      // recuperar url del documento subido
      return await task.storage
          .ref("images/imagen_$stamp.png")
          .getDownloadURL();
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      print("Error al subir la imagen: $e");
      return null;
    } catch (e) {
      // error
      print("Error al subir la imagen: $e");
      return null;
    }
  }

  Future<File> _imgFromCamera() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxHeight: 720,
      maxWidth: 720,
      imageQuality: 85,
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      print('No image selected.');
      return null;
    }
  }

  Future<File> _imgFromGallery() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      print('No image selected.');
      return null;
    }
  }

  Future<List<Avistamientos>> _getAvistamientos() async {
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
