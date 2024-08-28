import 'package:notapp/domain/datasources/local_storage_datasource.dart';
import 'package:notapp/domain/entities/note.dart';
import 'package:notapp/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl(this.datasource);

  @override
  Future<void> addNote(Note note) {
    return datasource.addNote(note);
  }

  @override
  Future<List<Note>> loadNotes({int limit = 10, offset = 0}) {
    return datasource.loadNotes(limit: limit, offset: offset);
  }
}
