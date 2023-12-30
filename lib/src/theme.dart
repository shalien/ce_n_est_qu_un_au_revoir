import 'package:flutter/material.dart';

const Color gold = Color.fromARGB(255, 255, 215, 0);
const Color silver = Color.fromARGB(255, 192, 192, 192);
const Color darkRoyalBlue = Color.fromARGB(255, 0, 35, 102);

const List<Color> newYearColors = [
  Colors.yellow,
  Colors.red,
  Colors.purple,
  Colors.blue,
  Colors.white,
  silver,
  gold,
];

ThemeData get lightTheme => ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: randomColor(), brightness: Brightness.light),
      useMaterial3: true,
    );

ThemeData get darkTheme => ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: randomColor(), brightness: Brightness.dark),
      useMaterial3: true,
    );

ThemeData get royalBlueTheme => ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: darkRoyalBlue, brightness: Brightness.dark),
      useMaterial3: true,
    );

Color randomColor() {
  List<Color> fromColors = <Color>[...newYearColors];

  fromColors.shuffle();
  return fromColors.first;
}

Color invert(Color color) => Color.fromARGB(
    color.alpha, 255 - color.red, 255 - color.green, 255 - color.blue);

Color secondary(Color color) => Color.fromARGB(
    color.alpha, color.red ~/ 2, color.green ~/ 2, color.blue ~/ 2);

Color tertiary(Color color) => Color.fromARGB(
    color.alpha, color.red ~/ 3, color.green ~/ 3, color.blue ~/ 3);
