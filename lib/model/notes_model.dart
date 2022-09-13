import '../../services/db/db_utils.dart';

class Note {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const Note({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  factory Note.fromJson(Map<String,Object?> json){
    return Note(
      id: json[NoteFields.id] as int?,
      isImportant: json[NoteFields.isImportant] == 1,
      number: json[NoteFields.id] as int,
      title: json[NoteFields.title] as String,
      description: json[NoteFields.description] as String,
      createdTime: DateTime.parse(json[NoteFields.createdTime] as String),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      NoteFields.id: id,
      NoteFields.isImportant: isImportant ? 1 : 0,
      NoteFields.number: number,
      NoteFields.title: title,
      NoteFields.description: description,
      NoteFields.createdTime: createdTime.toIso8601String(),
    };
  }
}
