import 'package:isar/isar.dart';
import 'package:notapp/domain/datasources/local_storage_datasource.dart';
import 'package:notapp/domain/entities/note.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([NoteSchema],
          inspector: true, directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<void> addNote(Note note) async {
    final isar = await db;

    isar.writeTxn(() async {
      await isar.notes.put(note);
      print("hola mundo");
    });
  }

  @override
  Future<List<Note>> loadNotes({int limit = 10, offset = 0}) async {
    final isar = await db;

    return isar.notes.where().offset(offset).limit(limit).findAll();
  }
}
