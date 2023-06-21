import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Connection {
  Database? _database;

  // Private constructor to enforce the singleton pattern
  Connection._();

  static final Connection instance = Connection._();

  Future<Database> getDatabase() async {
    if (_database != null) {
      return _database!;
    }

    final dbPath = await getDatabasesPath();
    final dbStorage = join(dbPath, "banco.db");

    _database = await openDatabase(
      dbStorage,
      version: 1,
      onCreate: (db, dbVersion) {
        String sql =
            "CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, completed INTEGER, date TEXT)";
        db.execute(sql);
      },
    );

    return _database!;
  }
}
