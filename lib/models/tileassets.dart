import 'package:flutter/material.dart';

class Tileasset {
  String tile;
  Icon? icon;
  AssetImage? assetImage;

  Tileasset({required this.tile, this.icon, this.assetImage});
}

List<Tileasset> sideMenutile = [
  Tileasset(tile: "Inicio", icon: const Icon(Icons.dashboard, color: Colors.white,size: 30,)),
  Tileasset(tile: "Amigos", icon: const Icon(Icons.person_add_alt_1, color: Colors.white,size: 30,)),
  Tileasset(tile: "Mensaje", icon: const Icon(Icons.message_outlined, color: Colors.white,size: 30,)),
  Tileasset(tile: "Perfil", icon: const Icon(Icons.person, color: Colors.white,size: 30,)),
  Tileasset(tile: "Configuracion", icon: const Icon(Icons.settings_sharp, color: Colors.white,size: 30,))

];