

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
// un simple boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);
// un simple listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);
// un simple int
final selectedColorProvider = StateProvider<int>((ref) => 0);