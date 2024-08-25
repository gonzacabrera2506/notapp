import 'package:notapp/domain/entities/note.dart';

abstract class NotesDatasource {
  Future<List<Note>> getNotes();
}
