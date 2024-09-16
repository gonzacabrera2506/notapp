import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notapp/domain/entities/note.dart';
import 'package:notapp/infrastructure/repositories/local_storage_repository_impl.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final LocalStorageRepositoryImpl addNoteRepository;
  NoteBloc({required this.addNoteRepository}) : super(const NoteState()) {
    on<AddNewNoteEvent>(_onAddNewNote);
  }

  void _onAddNewNote(AddNewNoteEvent event, Emitter<NoteState> emit) async {
    emit(state.copyWith(isSuccess: true, isFailure: false));
    try {
      await addNoteRepository.addNote(event.note);
    } catch (e) {
      emit(state.copyWith(
          isFailure: true,
          errorMessage:
              'Error en el registro de la nota. Intente nuevamente mas tarde.'));
    }
  }
}
