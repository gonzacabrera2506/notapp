import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notapp/domain/entities/note.dart';
import 'package:notapp/infrastructure/repositories/local_storage_repository_impl.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final LocalStorageRepositoryImpl noteRepository;
  NoteBloc({required this.noteRepository}) : super(const NoteState()) {
    on<AddNewNoteEvent>(_onAddNewNote);
    on<LoadNotesEvent>(_onLoadNotes);
  }

  void _onAddNewNote(AddNewNoteEvent event, Emitter<NoteState> emit) async {
    try {
      await noteRepository.addNote(event.note);
      emit(state.copyWith(isSuccess: true, isFailure: false));
      emit(state.copyWith(isSuccess: false));
    } catch (e) {
      emit(state.copyWith(
          isFailure: true,
          errorMessage:
              'Error en el registro de la nota. Intente nuevamente mas tarde.'));
      emit(state.copyWith(isFailure: false));
    }
  }

  void _onLoadNotes(LoadNotesEvent event, Emitter<NoteState> emit) async {
    try {
      await noteRepository.loadNotes(limit: 10, offset: 0);
      emit(state.copyWith(isSuccess: true, isFailure: false));
      emit(state.copyWith(isSuccess: false));
    } catch (e) {
      emit(state.copyWith(
          isFailure: true,
          errorMessage:
              'Error en la carga de las notas. Intente nuevamente mas tarde.'));
      emit(state.copyWith(isFailure: false));
    }
  }
}
