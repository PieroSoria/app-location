import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mudanzaya/controllers/controller.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Controller controller = Get.put(Controller());
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(37.773972, -122.431297), zoom: 11.5);
  @override
  void initState() {
    _requestLocationPermission();
    super.initState();
  }

  Future<void> _requestLocationPermission() async {
    final PermissionStatus status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      // El usuario otorgó permisos, ahora puedes mostrar el mapa.
    } else {
      // El usuario no otorgó permisos, puedes mostrar un mensaje o realizar otra acción.
      // En este ejemplo, simplemente imprimo un mensaje en la consola.
      debugPrint('Permiso de ubicación denegado por el usuario');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(20))),
              child: const GoogleMap(
                  myLocationButtonEnabled: false,
                  zoomGesturesEnabled: false,
                  initialCameraPosition: _initialCameraPosition),
            ),
          )
        ],
      ),
    );
  }
}
