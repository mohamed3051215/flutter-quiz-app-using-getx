import 'package:sqflite/sqflite.dart';

class SqfliteService {
  static insert(double result) async {
    final String dbPath = await getDatabasesPath();
    final Database db = await openDatabase(dbPath + "main.db", version: 1,
        onCreate: (Database db, int version) {
      db.execute(
          "CREATE TABLE IF NOT EXISTS main(id INTEGER PRIMARY KEY , result TEXT)");
    });
    await db
        .rawInsert('INSERT INTO main(result) VALUES("%${result.toString()}")');
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final String dbPath = await getDatabasesPath();
    final Database db = await openDatabase(dbPath + "main.db", version: 1,
        onCreate: (Database db, int version) {
      db.execute(
          "CREATE TABLE IF NOT EXISTS main(id INTEGER PRIMARY KEY , result TEXT)");
    });
    final List<Map<String, dynamic>> data =
        await db.rawQuery("SELECT * FROM main");

    return data;
  }

  static Future<void> clear() async {
    final String dbPath = await getDatabasesPath();
    final Database db = await openDatabase(dbPath + "main.db", version: 1,
        onCreate: (Database db, int version) {
      db.execute(
          "CREATE TABLE IF NOT EXISTS main(id INTEGER PRIMARY KEY , result TEXT)");
    });
    await db.delete("main");
  }
}
