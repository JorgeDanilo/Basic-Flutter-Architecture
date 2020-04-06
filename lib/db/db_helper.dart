import 'dart:async';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static final DatabaseHelper _instance = DatabaseHelper.getInstance();
  DatabaseHelper.getInstance();

  factory DatabaseHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if(_db != null) {
      return _db;
    }
    _db = await _initDb();
    return _db;
  }

  Future _initDb() async {
    var dbName = 'carros.db';
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
    print("db ${path}");
    var db = await openDatabase(path, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  Future<FutureOr<void>> _onCreate(Database db, int version) async {
    var loadString = await rootBundle.loadString("assets/sql/create.sql");
    List<String> sqls = loadString.split(";");
    for(String sql in sqls) {
      if(sql.trim().isNotEmpty)
        await db.execute(sql);
    }
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {
    print("onUpgrade oldVersion: $oldVersion: > newVersion: $newVersion");
    String sql = "alter table carro add column NOVA TEXT";
    executeSql(db, sql);
    if(oldVersion == 1 && newVersion == 2)  {
    }
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

  executeSql(Database db, String sql) {
    db.execute(sql);
  }


}