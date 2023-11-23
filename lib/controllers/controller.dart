import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mudanzaya/components/data_user.dart';
import 'package:mudanzaya/db/database.dart';

import '../firebase_auth_implements/firebase_storage.dart';

class Controller extends GetxController {
  SQLdb funciones = SQLdb();
  final FirebaseStorageService storagefire = FirebaseStorageService();
  RxBool cargando = false.obs;
  RxBool perfil = false.obs;
  RxString imagenPath = ''.obs;
  Rx<User?> user = Rx<User?>(FirebaseAuth.instance.currentUser);

  void iniciarEscuchaAutenticacion() {
    FirebaseAuth.instance.authStateChanges().listen((User? newUser) {
      // Actualizar el estado del usuario en el controlador
      user(newUser);
    });
  }

  RxList<UserData> usuario = <UserData>[].obs;

  // Future<void> getdatauser() async {
  //   String sql = "SELECT * FROM usuario";
  //   List<Map<String, dynamic>> usuariodata = await funciones.getData(sql);
  //   usuario.assignAll(usuariodata.map((map) => UserData.fromMap(map)).toList());
  // }

  // Future<void> guardarCambiosDePerfil(bool nuevoPerfil) async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.setBool('perfil', nuevoPerfil);

  //     perfil.value = nuevoPerfil;

  //     Get.snackbar('Éxito', 'Cambios de perfil guardados correctamente');
  //   } catch (e) {
  //     Get.snackbar('Error', 'Error al guardar los cambios de perfil');
  //   }
  // }

  // Future<void> cargarPerfil() async {
  //   String sql = "SELECT * FROM usuario WHERE status = 'activo'";
  //   bool result = await funciones.getData2(sql);
  //   if(result){
  //     perfil(true);
  //   }else{
  //     perfil(false);
  //   }
  // }

  Future<bool> getImagen(int select) async {
    final ImagePicker picker = ImagePicker();
    if (select == 0) {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        File? uploadimagen = File(image.path);
        String urlfoto = await storagefire.subirfoto(uploadimagen);
        // await userCredential.user!.updatePhotoURL(urlfoto);
        FirebaseAuth.instance.currentUser?.updatePhotoURL(urlfoto);
        imagenPath.value = image.path;
        return true;
      }
    } else if (select == 1) {
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        File? uploadimagen = File(image.path);
        String urlfoto = await storagefire.subirfoto(uploadimagen);
        // await userCredential.user!.updatePhotoURL(urlfoto);
        FirebaseAuth.instance.currentUser?.updatePhotoURL(urlfoto);
        imagenPath.value = image.path;
        return true;
      }
    }
    return false;
  }
}
