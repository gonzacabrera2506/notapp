part of 'note_bloc.dart';

sealed class NoteEvent extends Equatable {
  const NoteEvent();
}

class AddNewNoteEvent extends NoteEvent {
  final Note note;

  const AddNewNoteEvent({
    required this.note,
  });

  @override
  List<Object> get props => [
        note,
      ];
}

class LoadNotesEvent extends NoteEvent {
  final int limit;
  final int offset;

  const LoadNotesEvent({
    this.limit = 10,
    this.offset = 0,
  });

  @override
  List<Object> get props => [
        limit,
        offset,
      ];
}
