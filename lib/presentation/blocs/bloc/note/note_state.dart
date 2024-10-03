part of 'note_bloc.dart';

class NoteState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  final List<Note> notes;
  final String errorMessage;

  const NoteState({
    this.isLoading = false,
    this.isSuccess = false,
    this.isFailure = false,
    this.notes = const [],
    this.errorMessage = '',
  });

  NoteState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailure,
    List<Note>? notes,
    String? errorMessage,
  }) {
    return NoteState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        isSuccess,
        isFailure,
        notes,
      ];
}
