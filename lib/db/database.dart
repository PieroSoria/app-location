import 'package:flutter/material.dart';
import 'package:mudanzaya/models/data_user.dart';
import 'package:sqflite/sqflite.dart'
    show Database, getDatabasesPath, openDatabase;
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' show join;

class SQLdb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await inicializacion();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> inicializacion() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "Datos.db");
    Database mydb = await openDatabase(path, onCreate: _createDB, version: 1);
    return mydb;
  }

  _createDB(Database db, int version) async {
    await db.execute(
        "CREATE TABLE IF NOT EXISTS usuario (id TEXT PRIMARY KEY, nombre TEXT, apellido TEXT, email TEXT, token TEXT, status TEXT,urlfoto TEXT)");
    debugPrint("Base de datos creada");
  }

  Future<bool> insertarUsuario(UserData data,
      {Map<String, dynamic>? campos}) async {
    Database? mydb = await db;

    try {
      Map<String, dynamic> dataMap = campos ?? data.tomap();
      await mydb!.insert("usuario", dataMap);
      return true; 
    } catch (e) {
      debugPrint("Error al insertar usuario: $e");
      return false;
    }
  }

  Future<int> updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  Future<int> deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  Future<List<Map<String, dynamic>>> getData(String sql) async {
    Database? mydb = await db;
    List<Map<String, dynamic>> rep = await mydb!.rawQuery(sql);
    return rep;
  }
  Future<bool> getData2(String sql) async {
    Database? mydb = await db;
    List<Map> rep = await mydb!.rawQuery(sql);
    if(rep.isNotEmpty){
      return true;
    }
    return false;
  }
}
