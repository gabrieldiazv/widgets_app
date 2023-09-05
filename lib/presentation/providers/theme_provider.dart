import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// un simple boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);
// un simple listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);
// un simple int
final selectedColorProvider = StateProvider<int>((ref) => 0);
// un objeto de tipo de AppTheme (custom)
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier,AppTheme>(
      (ref) => ThemeNotifier()
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(
      isDarkMode: !state.isDarkMode
    );
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(
      selectColor: colorIndex
    );
  }
}
