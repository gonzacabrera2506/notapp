import 'package:notapp/domain/entities/note.dart';

abstract class LocalStorageDatasource {
  Future<List<Note>> loadNotes();
  Future<void> addNote(Note note);
}
