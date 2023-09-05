import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.purple
];

class AppTheme {
  final int selectColor;
  final bool isDarkMode;

  AppTheme({this.selectColor = 0, this.isDarkMode = false})
      : assert(selectColor >= 0, 'El color debe ser mayor o igual a 0'),
        assert(selectColor < colorList.length,
            'El color debe ser menor o igual a ${colorList.length - 9}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectColor],
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      );

  AppTheme copyWith({int? selectColor, bool? isDarkMode}) => AppTheme(
      selectColor: selectColor ?? this.selectColor,
      isDarkMode: isDarkMode ?? this.isDarkMode);
}
