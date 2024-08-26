import 'package:notapp/domain/entities/note.dart';

abstract class NotesRepository {
  Future<List<Note>> getNotes();
  Future<void> addNote(Note note);
}
