import 'package:get/get_connect/http/src/utils/utils.dart';

class NoteFields {
  static const String id = "id";
  static const String isImportant = "isImportant";
  static const String number = "number";
  static const String title = "title";
  static const String description = "description";
  static const String createdTime = "createdTime";

  static final List<String> values = [
    id,
    isImportant,
    title,
    number,
    description,
    createdTime,
  ];
}

class FieldsType {
  static const String textType = "TEXT NOT NULL";
  static const String idType = "INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT";
  static const String integerType = "INTEGER NOT NULL";
  static const String boolType = "BOOLEAN NOT NULL";
}
