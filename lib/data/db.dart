import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB{

  DB._();
  static final DB instance = DB._();
  //Instancia SQLIte
  static Database? _database;
  get database async {
    if(_database != null) return _database;
    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join( await getDatabasesPath(), 'notes.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, version) async {
    await db.execute(_notes);
    await db.insert(
      'notes', 
      {'text' : 'Exemplo de nota', 'modified' : '10000'});
  }

  String get _notes => '''
    CREATE TABLE notes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      text TEXT,
      modified INT
    );
  ''';

}
