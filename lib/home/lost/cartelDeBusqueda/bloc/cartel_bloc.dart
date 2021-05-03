import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:connectivity/connectivity.dart';
import 'package:test_canidae_2/models/carteles.dart';

part 'cartel_event.dart';
part 'cartel_state.dart';

class CartelBloc extends Bloc<CartelEvent, CartelState> {
  final _cFirestore = FirebaseFirestore.instance;
  final _cFirebase = FirebaseAuth.instance;
  File _selectedPicture;

  CartelBloc() : super(CartelInitial());

  @override
  Stream<CartelState> mapEventToState(
    CartelEvent event,
  ) async* {
    if (event is RequestAllCartelesEvent) {
      // conectarnos a firebase noSQL y traernos los docs
      yield LoadingState();
      yield LoadedCartelState(carteles: await _getCarteles() ?? []);
    } else if (event is GalleryImageEvent) {
      yield LoadingState();
      _selectedPicture = await _imgFromGallery();
      yield PickedImageState(image: _selectedPicture);
    } else if (event is CamaraImageEvent) {
      yield LoadingState();
      _selectedPicture = await _imgFromCamera();
      yield PickedImageState(image: _selectedPicture);
    } else if (event is SaveCartelEvent) {
      String imageUrl = await _uploadFile();
      if (imageUrl != null) {
        yield LoadingState();
        await _saveCartel(
          event.cartel.copyWith(
            urlToImage: imageUrl,
            idUser: _cFirebase.currentUser.uid,
          ),
        );
        // yield LoadedNewsState(noticiasList: await _getNoticias() ?? []);
        yield SavedCartelState();
      } else {
        yield ErrorMessageState(errorMsg: "No se pudo guardar la imagen");
      }
    }
  }

  Future<bool> _saveCartel(Carteles cartel) async {
    try {
      await _cFirestore.collection("Carteles").add(cartel.toJson());
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

  Future<List<Carteles>> _getCarteles() async {
    try {
      var carteles = await _cFirestore.collection("Carteles").get();
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
            ),
          )
          .toList();
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}
