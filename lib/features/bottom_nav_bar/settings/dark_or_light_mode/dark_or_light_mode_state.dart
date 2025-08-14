class DarkOrLightModeState {}

class DarkOrLightModeStateInit extends DarkOrLightModeState {}

class ThemeState extends DarkOrLightModeState {
  final bool isDarkMode;

  ThemeState(this.isDarkMode);
}
