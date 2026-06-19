import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  static Future<Database> initDB() async {
    String path = join(
      await getDatabasesPath(),
      'mahasiswa.db',
    );

    return await openDatabase(
      path,
      version: 1,

      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE mahasiswa(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT,
            ttl TEXT,
            gender TEXT,
            alamat TEXT,
            agama TEXT,
            pendidikan TEXT,
            hp TEXT,
            email TEXT
          )
        ''');
      },
    );
  }

  // INSERT
  static Future<int> insertMahasiswa(
    Map<String, dynamic> data,
  ) async {
    final db = await database;

    return await db.insert(
      'mahasiswa',
      data,
    );
  }

  // READ
  static Future<List<Map<String, dynamic>>> getMahasiswa() async {
    final db = await database;

    return await db.query('mahasiswa');
  }

  // UPDATE
  static Future<int> updateMahasiswa(
    int id,
    Map<String, dynamic> data,
  ) async {
    final db = await database;

    return await db.update(
      'mahasiswa',
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // DELETE
  static Future<int> deleteMahasiswa(
    int id,
  ) async {
    final db = await database;

    return await db.delete(
      'mahasiswa',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}