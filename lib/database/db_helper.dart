import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:talha_s_application_demo/model/user_model.dart';
import 'package:talha_s_application_demo/model/bowling_machine_model.dart';

class UserDBHelper {
  UserDBHelper._(); // private constructor to prevent instantiation

  static final UserDBHelper instance = UserDBHelper._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'fyp_database.db');
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            first_name TEXT,
            last_name TEXT,
            username TEXT,
            password TEXT
          )
        ''');
      },
    );

    // Print database path for debugging
    print('User Database path: $path');

    return database;
  }

  Future<void> insertUser(User user) async {
    Database db = await instance.database;
    await db.insert('users', user.toMap());
  }

  Future<List<Map<String, dynamic>>> queryUser(String username, String password) async {
    Database db = await instance.database;
    return await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
  }
}

class BowlingMachineDBHelper {
  BowlingMachineDBHelper._(); // private constructor to prevent instantiation

  static final BowlingMachineDBHelper instance = BowlingMachineDBHelper._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'ball_machine.db');
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE bowling_machines (
            session_id INTEGER PRIMARY KEY AUTOINCREMENT,
            start_time INTEGER,
            stop_time INTEGER,
            speed INTEGER,
            swing_type TEXT,
            username TEXT
          )
        ''');
      },
    );

    // Print database path for debugging
    print('Bowling Machine Database path: $path');

    return database;
  }

  Future<void> insertBowlingMachine(BowlingMachine machine) async {
    Database db = await instance.database;
    await db.insert('bowling_machines', machine.toMap());
  }

  Future<void> updateBowlingMachineStopTime(int sessionId, String stopTime) async {
    Database db = await instance.database;
    await db.rawUpdate(
      'UPDATE bowling_machines SET stop_time = ? WHERE session_id = ?',
      [stopTime, sessionId],
    );
  }


  Future<List<Map<String, dynamic>>> queryBowlingMachine(int sessionId) async {
    Database db = await instance.database;
    return await db.query(
      'bowling_machines',
      where: 'session_id = ?',
      whereArgs: [sessionId],
    );
  }
}
