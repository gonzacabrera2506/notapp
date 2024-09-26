import 'package:isar/isar.dart';

part 'note.g.dart';

@collection
class Note {
  Id? isarId;

  // final int id;
  final DateTime date;
  final String title;
  final String description;

  Note(
      {this.isarId,
      required this.date,
      required this.title,
      required this.description});
}
