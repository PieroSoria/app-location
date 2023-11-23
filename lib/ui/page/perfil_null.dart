import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class PerfilVacio extends StatefulWidget {
  const PerfilVacio({
    super.key,
  });

  @override
  State<PerfilVacio> createState() => _PerfilVacioState();
}

class _PerfilVacioState extends State<PerfilVacio> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/image/app.png"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.login);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue.shade900,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(20),
                ),
                child: const Text(
                  "Iniciar Session",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.registrar);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue.shade900,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(20),
                ),
                child: const Text(
                  "Crear Usuario",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
