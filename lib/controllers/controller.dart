import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mudanzaya/models/data_user.dart';
import 'package:mudanzaya/db/database.dart';

import '../firebase_auth_implements/firebase_storage.dart';

class Controller extends GetxController {
  SQLdb funciones = SQLdb();
  final FirebaseStorageService storagefire = FirebaseStorageService();
  RxBool cargando = false.obs;
  RxBool perfil = false.obs;
  RxString imagenPath = ''.obs;
  RxString nombreuser = ''.obs;
  RxString emailuser = ''.obs;
  RxString tokenuser = ''.obs;
  RxList<UserData> usuario = <UserData>[].obs;

  void iniciarEscuchaAutenticacion() {
    FirebaseAuth.instance.authStateChanges().listen((User? newUser) async {
      if (newUser != null) {
        UserData userData = await obtenerDatosUsuario(newUser);
        usuario.clear();
        usuario.add(userData);
      } else {
        usuario.clear();
      }
    });
  }

  Future<UserData> obtenerDatosUsuario(User user) async {
    List<String> nombreyapellido = user.displayName!.split(", ");
    String? token = await user.getIdToken();
    UserData userData = UserData(
      nombre: nombreyapellido[0],
      apellido: nombreyapellido[1],
      email: user.email ?? '',
      password: '',
      token: token!,
      urlfoto: user.photoURL ?? '',
    );

    return userData;
  }

  Future<bool> getImagen(int select) async {
    final ImagePicker picker = ImagePicker();
    if (select == 0) {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        File? uploadimagen = File(image.path);
        String urlfoto = await storagefire.subirfoto(uploadimagen);
        // await userCredential.user!.updatePhotoURL(urlfoto);
        FirebaseAuth.instance.currentUser?.updatePhotoURL(urlfoto);
        imagenPath.value = urlfoto;
        return true;
      }
    } else if (select == 1) {
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        File? uploadimagen = File(image.path);
        String urlfoto = await storagefire.subirfoto(uploadimagen);
        // await userCredential.user!.updatePhotoURL(urlfoto);
        FirebaseAuth.instance.currentUser?.updatePhotoURL(urlfoto);
        imagenPath.value = urlfoto;
        return true;
      }
    }
    return false;
  }
}
