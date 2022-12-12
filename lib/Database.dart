// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:fruitapp/fruitmodel.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

class DBHelper {

  /// Opening database
  static Future<sql.Database> init() async {
    final dbPath = await sql.getDatabasesPath();
    return await sql.openDatabase(
      path.join(dbPath, "shopping.db"),
      onCreate: (db, version) {
        db.execute(myProductsTable);
      },
      version: 1,
    );
  }

  static const String myProductsTable = "CREATE TABLE IF NOT EXISTS fruit("
      "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
      "fruitname TEXT NOT NULL,"
      "quantity INTEGER NOT NULL DEFAULT 0,"
      "price INTEGER NOT NULL DEFAULT 0"
      ")";



  static Future<int> addItem(Map<String, dynamic> data) async {
    //returns number of items inserted as an integer

    final db = await init(); //open database
    debugPrint('SHOW INSERTED RECORD DETAILS: $data');

    return db.insert(
      "fruit", data, //toMap() function from MemoModel
      conflictAlgorithm:
          ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  static Future<List<FruitModel>> fetchMemos() async {
    final db = await init();
    var res = await db.query("fruit");
    print('SHOW PRODUCTS TABLE OFFLINE RECORDS: $res');
    print('SHOW PRODUCTS TABLE OFFLINE RECORDS: ${res.length}');
    List<FruitModel> list =
        res.isNotEmpty ? res.map((c) => FruitModel.fromMap(c)).toList() : [];
    return list;
  }

  static Future<int> deleteMemo(int id) async {
    //returns number of items deleted
    final db = await init();

    int result = await db.delete("fruit", //table name
        where: "id = ?",
        whereArgs: [id] // use whereArgs to avoid SQL injection
        );

    return result;
  }

  static Future<void> updateQuantity(int id, int quantity) async {
    final db = await DBHelper.init();
    await db.rawUpdate(
      "UPDATE fruit SET quantity ='$quantity' WHERE id = '$id' ",
    );
  }

  static Future<int> count() async {
    final db = await DBHelper.init();
    var counts = Sqflite
    .firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM fruit')
    )!;
    return counts;
  }

  static Future<List<FruitModel>> check(String name) async {
    final db = await DBHelper.init();
    var res =
    await db.query("fruit", where: 'fruitname = ?', whereArgs: [name]);
    List<FruitModel> list =
    res.isNotEmpty ? res.map((c) => FruitModel.fromMap(c)).toList() : [];
    return list;
  }

  static close() async {
    final db = await DBHelper.init();
    db.close();
  }
}
