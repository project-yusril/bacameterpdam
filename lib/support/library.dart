import 'dart:io';

import 'package:bacameterpdam/support/gambarmeter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:sqflite/sqflite_api.dart';

class LibraryPdam {
  static LibraryPdam _librarypdam;
  LibraryPdam._createInstance();

  static Database _database;

  String gambarmeterTable='gambarmeterTable';
  String columnId='id';
  String columnFoto='foto';
  String columnNomorPelanggan='nomorpelanggan';

  factory LibraryPdam(){
    if(_librarypdam==null) {
      _librarypdam=LibraryPdam._createInstance();
    }
    return _librarypdam;
  }

  Future<Database> get database async {
    if(_database==null) {
      _database= await initDataBase();
    }
    return _database;
  }

  Future<Database> initDataBase() async {
    Directory directory= await getApplicationDocumentsDirectory();
    String path= directory.path+'gambarmeter.db';
    
    var gambarmeterDatabase= await openDatabase(path,version: 1, onCreate: _createDBPDAM);
    return gambarmeterDatabase;
  }

  void _createDBPDAM(Database db, int namaversi) async {
    await db.execute('CREATE TABLE $gambarmeterTable($columnId INTEGER PRIMARY KEY, $columnFoto text, $columnNomorPelanggan)');
  }

  Future<List<Map<String, dynamic>>> getAmbilGambarMaplist() async {
    Database db= await this.database;

    var result= await db.query(gambarmeterTable);
    return result;
  }

  Future<int> insertGambar(GambarMeter gambar) async {
    Database db= await this.database;
    var result= db.insert(gambarmeterTable, gambar.toMap());
    return result;
  }

  Future<int> updateGambar(GambarMeter gambar) async {
    Database db= await this.database;
    var result= db.update(gambarmeterTable, gambar.toMap(), where: '$columnId=?', whereArgs:[gambar.id]);
    return result;
  }

  Future<int> hapusGambar(int id) async {
    Database db= await this.database;
    int result= await db.rawDelete('DELETE FROM $gambarmeterTable WHERE $columnId=$id');
    return result;
  }

  Future<int> getCount() async {
    Database db= await this.database;
    List<Map<String, dynamic>> valor= await db.rawQuery('SELECT COUNT(*) FROM $gambarmeterTable');
    int result=Sqflite.firstIntValue(valor);
    return result;
  }

  Future<List<GambarMeter>> ambilGambarMaplist() async {
    var gambarMapList= await getAmbilGambarMaplist();
    int count= gambarMapList.length;
    List<GambarMeter> gambarList= List<GambarMeter>();
    for (int i=0; i<count; i++) {
      gambarList.add(GambarMeter.fromMapObject(gambarMapList[i]));
    }
    return gambarList;
  }
}