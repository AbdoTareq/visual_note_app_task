import 'package:sqflite/sqflite.dart';
import 'package:visual_note_app_task/models/note.dart';

import '../export.dart';

const String tableNote = 'Note';

const String columnId = '_id';
const String columnTitle = 'title';
const String columnDescription = 'description';
const String columnImage = 'image';
const String columnDate = 'dateInMiliSeconds';
const String columnIsOpen = 'isOpen';

abstract class NoteRepository {
  Future<Note> insert(Note note);
  Future<List<Note>> getAll();
  Future<Note?> getNote(int id);
  Future<int> update(Note note);
  Future<int> delete(int id);
}

class DbManager implements NoteRepository {
  DbManager._privateConstructor();

  static final DbManager _instance = DbManager._privateConstructor();

  factory DbManager() {
    return _instance;
  }
  late Database db;

  Future open() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + '/demo.db';

    db = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableNote (
  $columnId integer primary key autoincrement,
  $columnTitle text not null,
  $columnDescription text not null,
  $columnDate integer not null,
  $columnImage blob not null,
  $columnIsOpen integer not null)
''');
    });
  }

  @override
  Future<Note> insert(Note note) async {
    await open();
    note.copyWith(id: await db.insert(tableNote, note.toMap()));
    return note;
  }

  @override
  Future<Note?> getNote(int id) async {
    await open();
    List<Map> maps = await db.query(tableNote,
        columns: [columnId, columnIsOpen, columnTitle, columnDate, columnDescription, columnImage],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Note.fromMap(maps.first);
    }
    return null;
  }

  @override
  Future<List<Note>> getAll() async {
    await open();
    var notes = <Note>[];
    List<Map> maps = await db.query(
      tableNote,
      columns: [columnId, columnIsOpen, columnTitle, columnDate, columnDescription, columnImage],
    );
    for (var item in maps) {
      notes.add(Note.fromMap(item));
    }
    return notes;
  }

  @override
  Future<int> delete(int id) async {
    await open();
    return await db.delete(tableNote, where: '$columnId = ?', whereArgs: [id]);
  }

  @override
  Future<int> update(Note note) async {
    await open();
    return await db.update(tableNote, note.toMap(), where: '$columnId = ?', whereArgs: [note.id]);
  }

  Future close() async => db.close();
}
