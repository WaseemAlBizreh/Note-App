import 'package:flutter/cupertino.dart';
import 'package:note_app/services/db/notes_db_utils.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotesDatabase {
  NotesDatabase._init();

  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  static const _dbName = "notes.db";
  static const _dbVersion = 1;
  static const _tableName = "notes";

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initialDatabase();
    return _database!;
  }

  Future<Database> initialDatabase() async {
    final filePath = await getDatabasesPath();
    final path = join(filePath, _dbName);

    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreated,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreated(Database db, int version) async {
    await db.execute('''
      CREATE TABLE "$_tableName" (
        ${NoteFields.id} ${FieldsType.idType}
        ${NoteFields.isImportant} ${FieldsType.boolType}
        ${NoteFields.number} ${FieldsType.integerType}
        ${NoteFields.title} ${FieldsType.textType}
        ${NoteFields.description} ${FieldsType.textType}
        ${NoteFields.createdTime} ${FieldsType.textType}
      )
    ''');
    debugPrint("CREATE Database and Table =============================");
  }

  Future _onUpgrade(Database db, int oldVersion , int newVersion) async {}

  Future close() async {
    final database = await instance.database;
    database.close();
  }
}
