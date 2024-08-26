import 'package:notapp/domain/entities/note.dart';

abstract class LocalStorageRepository {
  Future<List<Note>> loadNotes();
}
