import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudanzaya/controllers/controller.dart';
import 'package:mudanzaya/ui/page/perfil_null.dart';
import 'package:mudanzaya/ui/page/perfil_usuario_login.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final controller = Get.put(Controller());

  @override
  void initState() {
    debugPrint(controller.emailuser.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data == null) {
              return const PerfilVacio();
            } else {
              controller.nombreuser(snapshot.data!.displayName);
              controller.imagenPath(snapshot.data!.photoURL);
              controller.emailuser(snapshot.data!.email);
              controller.tokenuser(snapshot.data!.getIdToken().toString());
              return const PerfilSuccess();
            }
          },
        ),
      ),
    );
  }
}
