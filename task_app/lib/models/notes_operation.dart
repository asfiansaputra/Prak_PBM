import 'package:flutter/cupertino.dart';
import 'package:task_app/models/note.dart';

class NotesOperation extends ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get getNotes {
    return _notes;
  }

  NotesOperation() {
    addNewNote('First Note', 'First Note Content');
  }

  void addNewNote(String title, String content) {
    Note note = Note(title, content);
    _notes.add(note);
    notifyListeners();
  }
}
