import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudanzaya/components/data_user.dart';
import 'package:mudanzaya/components/input_form.dart';
import 'package:mudanzaya/firebase_auth_implements/firebase_auth.dart';
import 'package:mudanzaya/firebase_auth_implements/firebase_storage.dart';
import 'package:mudanzaya/ui/routes/routes.dart';

import '../api/user_api_sql.dart';
import '../controllers/controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController veripassword = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController apellido = TextEditingController();
  Controller controller = Get.put(Controller());
  final FirebaseAuthService fire = FirebaseAuthService();
  final FirebaseStorageService storagefire = FirebaseStorageService();
  ApiConnection conex = ApiConnection();
  File? uploadimagen;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    veripassword.dispose();
    nombre.dispose();
    apellido.dispose();
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomInputField(
                      label: "Nombre",
                      onChanged: (text) {},
                      controller: nombre,
                    ),
                    CustomInputField(
                      label: "Apellidos",
                      onChanged: (text) {},
                      controller: apellido,
                    ),
                    CustomInputField(
                      label: "Correo",
                      onChanged: (text) {
                        setState(() {});
                      },
                      inputType: TextInputType.emailAddress,
                      validator: (text) {
                        if (text == null) return null;
                        if (text.contains("@")) {
                          return null;
                        }
                        return "Invalid email address";
                      },
                      controller: email,
                    ),
                    CustomInputField(
                      label: "Contraseña",
                      onChanged: (text) {},
                      ispassword: true,
                      controller: password,
                    ),
                    CustomInputField(
                      label: "Verificar Contraseña",
                      onChanged: (text) {},
                      ispassword: true,
                      controller: veripassword,
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: ElevatedButton(
                            onPressed: () async {
                              controller.cargando(true);
                              // File? uploadimagen =
                              //     File(controller.imagenPath.value);
                              // String urlfoto =
                              //     await storagefire.subirfoto(uploadimagen);
                              final UserData data = UserData(
                                  nombre: nombre.text,
                                  apellido: apellido.text,
                                  email: email.text,
                                  password: password.text,
                                  token: '',
                                  status: '',
                                  urlfoto: '');
                              // bool result = await conex.crearusuario(data);

                              final userdata = await fire
                                  .crearusuarioconemailypassword(data);

                              if (userdata.error == null) {
                                controller.cargando(false);
                                Get.toNamed(Routes.inicio);
                                Get.snackbar("Exito", "Se creo correctamente un nuevo usuario");
                              }else{
                                Get.snackbar("Error", "Ocurrio un problema! Intentelo mas tarde!");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.blue.shade900,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.all(20),
                            ),
                            child: controller.cargando.value == false
                                ? const Text(
                                    "Crear Cuenta",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Poppins"),
                                  )
                                : const CircularProgressIndicator()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: ElevatedButton(
                          onPressed: () async {
                            Get.toNamed(Routes.inicio);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.blue.shade900,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                          ),
                          child: const Text(
                            "Salir",
                            style: TextStyle(
                                color: Colors.black, fontFamily: "Poppins"),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
