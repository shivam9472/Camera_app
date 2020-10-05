import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath(); //to create database
    return sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: /*if database not found then create  a database*/ (db,
            version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY  ,title TEXT ,image TEXT,loc_lat REAL,loc_lng REAL,address TEXT)');
    }, version: 1); //to open the database saved inside the phone
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm
          .replace, /*to override when found anything similar*/
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table); //to get the data
  }
}
