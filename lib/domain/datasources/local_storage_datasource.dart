import 'package:notapp/domain/entities/note.dart';

abstract class LocalStorageDatasource {
  Future<List<Note>> loadNotes({int limit = 10, offset = 0});
  Future<void> addNote(Note note);
}
