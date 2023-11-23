import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../components/botom_sheet.dart';
import '../../controllers/controller.dart';

class PerfilSuccess extends StatefulWidget {
  const PerfilSuccess({super.key});

  @override
  State<PerfilSuccess> createState() => _PerfilSuccessState();
}

class _PerfilSuccessState extends State<PerfilSuccess> {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      User? currentUser = controller.user.value;

      if (currentUser == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        List<String?> nombreYApellido = currentUser.displayName!.split(", ");
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      child: currentUser.photoURL != ""
                          ? Image.network(currentUser.photoURL!)
                          : Image.asset("assets/image/app.png"),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 10,
                      child: InkWell(
                        onTap: () async {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            backgroundColor:
                                const Color.fromARGB(0, 194, 193, 193),
                            builder: (builder) {
                              return const Botomsheet();
                            },
                          );
                        },
                        child: const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(nombreYApellido[0]!),
              Text(nombreYApellido[1]!),
              Text(currentUser.email!),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: currentUser.photoURL == ""
                      ? const DecorationImage(
                          image: AssetImage("assets/image/app.png"))
                      : DecorationImage(
                          image: NetworkImage(currentUser.photoURL!)),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const Text("Cerrar Sesión"),
              ),
            ],
          ),
        );
      }
    });
  }
}
