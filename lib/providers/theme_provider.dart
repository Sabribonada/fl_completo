import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;
  ThemeProvider({required bool isDarkMode})
      : currentTheme = isDarkMode ? darkTheme : lightTheme;

  setLightMode() {
    currentTheme = lightTheme;
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = darkTheme;
    notifyListeners();
  }

  static const Color primaryLight = Colors.pink;
  static const Color primaryDark = Color.fromARGB(255, 35, 22, 71);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primaryLight,
      appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(241, 69, 121, 0.589), elevation: 0),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: primaryLight)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryLight, elevation: 5),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: primaryLight,
            elevation: 0),
      ),
      scaffoldBackgroundColor: Colors.grey[300],
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: Colors.purple),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10))),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
      ));

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primaryDark,
    appBarTheme: const AppBarTheme(color: primaryDark, elevation: 0),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: primaryDark)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryDark, elevation: 5),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: primaryDark,
          elevation: 0),
    ),
  );
}
