import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mudanzaya/models/data_user.dart';

class FirebaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<SignUpResponsy> crearusuarioconemailypassword(UserData data) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
          email: data.email, password: data.password);
      await userCredential.user!
          .updateDisplayName("${data.nombre}, ${data.apellido}");
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

  Future<SignUpResponsy> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      debugPrint("Es ${credential.toString()}");
      final UserCredential s =
          await FirebaseAuth.instance.signInWithCredential(credential);
      debugPrint(s.toString());
      return SignUpResponsy(null, s.user);
    } catch (e) {
      return SignUpResponsy(e.toString(), null);
    }
  }
}
