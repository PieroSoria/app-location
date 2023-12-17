import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudanzaya/components/btnform.dart';
import 'package:mudanzaya/controllers/controller.dart';
import 'package:mudanzaya/firebase_auth_implements/firebase_auth.dart';

import '../../models/data_user.dart';
import '../../components/input_form.dart';
import '../routes/routes.dart';

class PerfilVacio extends StatefulWidget {
  const PerfilVacio({super.key});

  @override
  State<PerfilVacio> createState() => _PerfilVacioState();
}

class _PerfilVacioState extends State<PerfilVacio> {
  final email = TextEditingController();
  final pass = TextEditingController();
  final controller = Get.put(Controller());
  final fire = FirebaseAuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/image/app.png",
              width: 300,
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: CustomInputField(
                controller: email,
                label: "Usuario",
                inputType: TextInputType.emailAddress,
                validator: (text) {
                  if (text == null) return null;
                  if (text.contains("@")) {
                    return null;
                  }
                  return "Invalid email address";
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: CustomInputField(
                controller: pass,
                label: "Contraseña",
                ispassword: true,
                validator: (text) {
                  if (text!.length < 8) {
                    return "La contraseña es muy corta";
                  }

                  if (text.isEmpty) {
                    return "La contraseña no puede ser vacio";
                  }
                  return "";
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: BtnForm(
                  function: () async {
                    controller.cargando(true);
                    final data = UserData(
                        nombre: "",
                        apellido: "",
                        email: email.text,
                        password: pass.text,
                        token: "",
                        urlfoto: '');
                    final usersuccess =
                        await fire.iniciarsessionconemailypassword(data);
                    String? token = await usersuccess.user!.getIdToken();
                    if (token!.isNotEmpty) {
                      controller.cargando(true);
                      Get.toNamed(Routes.success);
                      controller.cargando(false);
                    }
                  },
                  label: "Iniciar Session",
                )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "OR",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        color: Color.fromARGB(255, 128, 124, 124),
                      ),
                    ),
                  ),
                  Expanded(child: Divider())
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () async {
                    await fire.signInWithGoogle();
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 180, 180, 180),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Icon(
                      Icons.g_mobiledata,
                      size: 60,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 180, 180, 180),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Icon(
                      Icons.g_mobiledata,
                      size: 60,
                    ),
                  ),
                )
              ],
            ),
            const Row(
              children: [
                Expanded(child: Divider()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: BtnForm(
                function: () {
                  Get.toNamed(Routes.registrar);
                },
                label: "Crear Usuario",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
