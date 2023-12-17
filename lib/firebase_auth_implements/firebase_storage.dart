import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseStorageService {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> subirfoto(File image) async {
    final String namefile = image.path.split("/").last;
    Reference ref = storage.ref().child("Imagenes").child(namefile);
    final UploadTask uploadTask = ref.putFile(image);
    final TaskSnapshot snapshot = await uploadTask.whenComplete(() => String);
    final String urlfinal = await snapshot.ref.getDownloadURL();
    debugPrint(urlfinal);

    return urlfinal;
  }
}
