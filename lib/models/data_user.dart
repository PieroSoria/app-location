import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  String nombre, apellido, email, password, token, urlfoto;
  UserData(
      {required this.nombre,
      required this.apellido,
      required this.email,
      required this.password,
      required this.token,
      required this.urlfoto});
  Map<String, dynamic> tomap() {
    return {
      'nombre': nombre,
      'apellido': apellido,
      'email': email,
      'password': password,
      'token': token,
      'urlfoto': urlfoto,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      nombre: map['nombre'] ?? '',
      apellido: map['apellido'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      token: map['token'] ?? '',
      urlfoto: map['urlfoto'] ?? '',
    );
  }
}

class SignUpResponsy {
  final String? error;
  final User? user;

  SignUpResponsy(this.error, this.user);
}
