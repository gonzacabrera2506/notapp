import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'dark_theme_event.dart';
part 'dark_theme_state.dart';

class DarkThemeBloc extends Bloc<DarkThemeEvent, DarkThemeState> {
  DarkThemeBloc() : super(const DarkThemeState()) {
    on<SetDarkTheme>(_setDarkTheme);
  }

  void _setDarkTheme(SetDarkTheme event, Emitter<DarkThemeState> emit) async {
    emit(state.copyWith(
      dark: event.isDarkTheme,
    ));
  }
}
