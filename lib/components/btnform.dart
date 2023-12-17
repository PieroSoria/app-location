import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controller.dart';

class BtnForm extends StatefulWidget {
  final Function() function;
  final String label;
  const BtnForm({super.key, required this.function, required this.label});

  @override
  State<BtnForm> createState() => _BtnFormState();
}

class _BtnFormState extends State<BtnForm> {
  final controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.function,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue.shade900,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(20),
        ),
        child: controller.cargando.value == false
            ? Text(
                widget.label,
                style: const TextStyle(color: Colors.black, fontFamily: "Poppins"),
              )
            : const CircularProgressIndicator());
  }
}
