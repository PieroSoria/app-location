import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudanzaya/controllers/controller.dart';

class Botomsheet extends StatefulWidget {
  const Botomsheet({
    super.key,
  });

  @override
  State<Botomsheet> createState() => _BotomsheetState();
}

class _BotomsheetState extends State<Botomsheet> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Color.fromARGB(176, 69, 76, 94),
                  Color.fromARGB(174, 45, 51, 59),
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () async {
                        Navigator.of(context).pop();
                        bool result = await controller.getImagen(0);
                        if (result) {
                          
                          controller.iniciarEscuchaAutenticacion();
                          Get.snackbar(
                              "Exito", "Se actualizo su foto de perfil");
                        } else {
                          // controller.iniciarEscuchaAutenticacion();
                          Get.snackbar("Error",
                              "Ocurrio un problema! intentelo mas tarde!!");
                        }
                      },
                      child: const Column(
                        children: [
                          Icon(
                            Icons.photo,
                            color: Colors.white,
                            size: 35,
                          ),
                          SizedBox(
                            width: 120,
                            child: Text(
                              "Usar Foto de galeria",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.of(context).pop();
                        bool result = await controller.getImagen(1);
                        if (result) {
                          controller.iniciarEscuchaAutenticacion();
                          Get.snackbar(
                              "Exito", "Se actualizo su foto de perfil");
                        } else {
                          controller.iniciarEscuchaAutenticacion();
                          Get.snackbar("Error",
                              "Ocurrio un problema! intentelo mas tarde!!");
                        }
                      },
                      child: const Column(
                        children: [
                          Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.white,
                            size: 35,
                          ),
                          SizedBox(
                            width: 120,
                            child: Text("Usar camara para la foto",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                    fontSize: 16)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
