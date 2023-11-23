import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudanzaya/api/user_api_sql.dart';
import 'package:mudanzaya/components/data_user.dart';
import 'package:mudanzaya/components/input_form.dart';
import 'package:mudanzaya/controllers/controller.dart';
import 'package:mudanzaya/db/database.dart';
import 'package:mudanzaya/firebase_auth_implements/firebase_auth.dart';
import 'package:mudanzaya/ui/routes/routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseAuthService fire = FirebaseAuthService();
  ApiConnection conex = ApiConnection();
  Controller controller = Get.put(Controller());
  SQLdb funciones = SQLdb();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/image/app.png",
                      scale: 1.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomInputField(
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
                          CustomInputField(
                            controller: password,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: ElevatedButton(
                                onPressed: () async {
                                  controller.cargando(true);
                                  final UserData data = UserData(
                                      nombre: "",
                                      apellido: "",
                                      email: email.text,
                                      password: password.text,
                                      token: "",
                                      status: 'activo',
                                      urlfoto: '');
                                  final usersuccess = await fire
                                      .iniciarsessionconemailypassword(data);
                                  String? token =
                                      await usersuccess.user!.getIdToken();
                                  // String? urlfoto = usersuccess.user!.photoURL;
                                  // List<String> nombreYApellido = usersuccess
                                  //     .user!.displayName!
                                  //     .split(', ');
                                  if (token!.isNotEmpty) {
                                    // String nombre = nombreYApellido[0];
                                    // String apellido = nombreYApellido[1];
                                    // final UserData datafinal = UserData(
                                    //     nombre: nombre,
                                    //     apellido: apellido,
                                    //     email:
                                    //         usersuccess.user!.email.toString(),
                                    //     password: "",
                                    //     token: token,
                                    //     status: 'activo',
                                    //     urlfoto: urlfoto!);
                                    // bool result = await funciones
                                    //     .insertarUsuario(datafinal, campos: {
                                    //   'nombre': nombre,
                                    //   'apellido': apellido,
                                    //   'email': usersuccess.user!.email,
                                    //   'token': token,
                                    //   'status': 'activo',
                                    //   'urlfoto': urlfoto
                                    // });
                                    // if (result) {
                                    //   controller.cargando(false);
                                    //   controller.perfil(true);
                                    //   Get.snackbar('Éxito', 'Se Inicio session correctamente');
                                    //   Get.toNamed(Routes.inicio);
                                    // }else{
                                    //   Get.snackbar('Error', 'EL usuario o contraseña son invalidos');
                                    // }
                                    controller.cargando(false);
                                    controller.perfil(true);
                                    controller.iniciarEscuchaAutenticacion();
                                    Get.toNamed(Routes.inicio);
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
                                        "Iniciar Session",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Poppins"),
                                      )
                                    : const CircularProgressIndicator()),
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
                                  padding: const EdgeInsets.all(20),
                                ),
                                child: const Text(
                                  "Cancelar",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Poppins"),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
