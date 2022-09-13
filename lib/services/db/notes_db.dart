import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/notes_model.dart';
import '../../services/db/db_utils.dart';

class NotesDatabase {
  NotesDatabase._init();

  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  static const _dbName = "notes.db";
  static const _dbVersion = 1;
  static const _tableName = "notes";

  //get database
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initialDatabase();
    return _database!;
  }

  //initial database
  Future<Database> initialDatabase() async {
    final filePath = await getDatabasesPath();
    final path = join(filePath, _dbName);

    return await openDatabase(path, version: _dbVersion, onCreate: _onCreated);
  }

  //created database
  Future _onCreated(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        ${NoteFields.id} ${FieldsType.idType},
        ${NoteFields.isImportant} ${FieldsType.boolType},
        ${NoteFields.number} ${FieldsType.integerType},
        ${NoteFields.title} ${FieldsType.textType},
        ${NoteFields.description} ${FieldsType.textType},
        ${NoteFields.createdTime} ${FieldsType.textType}
      )
    ''');
    debugPrint("CREATE Database and Table =============================");
  }

  // Future _onUpgrade(Database db, int oldVersion , int newVersion) async {}

  Future<void> close() async {
    final database = await instance.database;
    database.close();
  }

  Future<int> createNote(Note note) async {
    final db = await instance.database;
    return await db.insert(_tableName, note.toMap());
  }

  Future<Note> getNote(int id) async {
    final db = await instance.database;
    final List<Map<String, Object?>> dbMap = await db.query(
      _tableName,
      columns: NoteFields.values,
      where: "${NoteFields.id} = ?",
      whereArgs: [id],
    );
    if (dbMap.isNotEmpty) {
      return Note.fromJson(dbMap.first);
    } else {
      throw 'Note id: $id not found';
    }
  }

  Future<List<Note>> getAllNotes() async {
    final db = await instance.database;
    const String orderBy = "${NoteFields.createdTime} ASC";
    final List<Map<String, Object?>> dbMap = await db.query(
      _tableName,
      orderBy: orderBy,
    );
    if (dbMap.isNotEmpty) {
      return dbMap.map((e) => Note.fromJson(e)).toList();
    } else {
      throw 'No Notes found';
    }
  }

  Future<int> updateNote(Note note) async {
    final db = await instance.database;
    return await db.update(
      _tableName,
      note.toMap(),
      where: "${NoteFields.id} = ?",
      whereArgs: [note.id],
    );
  }

  Future<int> deleteNote(int id) async {
    final db = await instance.database;
    return await db.delete(
      _tableName,
      where: "${NoteFields.id} = ?",
      whereArgs: [id],
    );
  }

  Future<int> deleteAllNotes() async {
    final db = await instance.database;
    return await db.delete(_tableName);
  }
}
