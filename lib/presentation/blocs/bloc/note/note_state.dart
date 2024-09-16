part of 'note_bloc.dart';

class NoteState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  final String errorMessage;

  const NoteState({
    this.isLoading = false,
    this.isSuccess = false,
    this.isFailure = false,
    this.errorMessage = '',
  });

  NoteState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
  }) {
    return NoteState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        isSuccess,
        isFailure,
      ];
}
