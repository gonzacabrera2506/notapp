part of 'dark_theme_bloc.dart';

sealed class DarkThemeEvent extends Equatable {
  const DarkThemeEvent();
}

class SetDarkTheme extends DarkThemeEvent {
  final bool isDarkTheme;

  const SetDarkTheme({required this.isDarkTheme});

  @override
  List<Object?> get props => [isDarkTheme];
}
