import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseConnect {
  static Database? _database;
  Future<Database> get database async =>
      _database ??= await initializeDatabase();

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'tutorialdb.db';

    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: createTable);
    return notesDatabase;
  }

  void createTable(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE employee(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, address TEXT)');
  }

  Future<int> insertStatic() async {
    Database db = await this.database;
    var result = await db.rawInsert(
        "INSERT INTO employee(name,address) VALUES('steve rogers','brooklyn')");
    return result;
  }

  Future<List<Map<String, dynamic>>> getList() async {
    Database db = await this.database;
    var result = await db.rawQuery('SELECT * FROM employee order by id ASC');
    return result;
  }
}
