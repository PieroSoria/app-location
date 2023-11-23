import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagenUser extends StatefulWidget {
  const ImagenUser({super.key});

  @override
  State<ImagenUser> createState() => _ImagenUserState();
}

class _ImagenUserState extends State<ImagenUser> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/image/app.png"))),
      ),
    );
  }
}
