import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mudanzaya/models/data_user.dart';

class ApiConnection {
  Future<bool> iniciarsession(String email, String password) async {
    var cliente = http.Client();
    try {
      var url = Uri.https('pierosoria.000webhostapp.com', 'services_auth.php');
      var response =
          await http.post(url, body: {'email': email, 'pass': password});
      var responseInfo = json.decode(response.body);
      if (responseInfo != null) {
        debugPrint("$responseInfo");
        return true;
      }
      return false;
    } finally {
      cliente.close();
    }
  }

  Future<bool> crearusuario(UserData data) async {
    var cliente = http.Client();
    try {
      var url =
          Uri.https('pierosoria.000webhostapp.com', 'services_create_user.php');
      var response = await http.post(url, body: {
        'nombre': data.nombre,
        'apellido': data.apellido,
        'email': data.email,
        'pass': data.password,
        'urlfoto': data.urlfoto
      });

      var responseInfo = response.body;
      if (responseInfo.isNotEmpty) {
        debugPrint(" $responseInfo");
        return true;
      }
      return false;
    } finally {
      cliente.close();
    }
  }
}
