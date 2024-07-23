
import 'package:flutter/foundation.dart';
import 'package:notes/data/db.dart';
import 'package:notes/model/note.dart';
import 'package:sqflite/sqflite.dart';

class NotesRepository extends ChangeNotifier{
  late Database db;
  List<Note> _notes = []; 

  List<Note> get notes => [..._notes];

  NotesRepository(){
    _initiNotesRepository();
  }

  _initiNotesRepository() async{
    await  getNotes();
  }

  Future<void> getNotes() async {
    db = await DB.instance.database;
    _notes.clear();
    List notes = await db.query('notes');
    for (var note in notes) {
      _notes.add(Note(id: note['id'], text: note['text'], modified: note['modified']));
    }
    notifyListeners();
  }

  setNotes(int id, String text, int modified) async {
    db = await DB.instance.database;

    await db.rawUpdate(
      'UPDATE notes SET text = ?, modified = ? WHERE id = ?',
      [text, modified, id]
    );  
    
    getNotes();
    notifyListeners();
  }

   insertNotes() async {
    db = await DB.instance.database;
    int id =await db.rawInsert('INSERT INTO notes(text, modified) VALUES("Nova nota", ${DateTime.now().millisecondsSinceEpoch})');
    var notes = await db.query('notes',
      where: 'id = ?',
      whereArgs: [id]);
    for (var note in notes) {
      _notes.add(Note(id: note['id'] as int , text: note['text'].toString(), modified: note['modified'] as int));
    } 
    notifyListeners(); 
  }

  deleteNote(int id) async{
    db = await DB.instance.database;    
    await db.rawDelete('DELETE FROM notes WHERE id = ?', ['$id']);
    getNotes();
    notifyListeners();
  }
}