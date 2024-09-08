part of 'dark_theme_bloc.dart';

class DarkThemeState extends Equatable {
  final bool dark;

  const DarkThemeState({
    this.dark = false,
  });

  DarkThemeState copyWith({
    bool? dark,
  }) {
    return DarkThemeState(
      dark: dark ?? this.dark,
    );
  }

  @override
  List<Object> get props => [
        dark,
      ];
}
