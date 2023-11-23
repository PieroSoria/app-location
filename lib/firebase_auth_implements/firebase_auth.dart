import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudanzaya/components/data_user.dart';

class FirebaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<SignUpResponsy> crearusuarioconemailypassword(
      UserData data) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
          email: data.email, password: data.password);
      await userCredential.user!
          .updateDisplayName("${data.nombre}, ${data.apellido}");
      await auth.signOut();
      return SignUpResponsy(null, userCredential.user);
    } on FirebaseAuthException catch (e) {
      return SignUpResponsy(e.code, null);
    }
  }

  Future<SignUpResponsy> iniciarsessionconemailypassword(UserData data) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: data.email, password: data.password);
      Get.snackbar('Éxito', 'Se Inicio session correctamente');
      return SignUpResponsy(null, credential.user);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', 'EL usuario o contraseña son invalidos');
      debugPrint("Failed to create for $e");
      return SignUpResponsy(e.code, null);
    }
  }
}
