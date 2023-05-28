import 'package:flutter/material.dart';

import 'package:expense_tracker/widget/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 189, 124));

var kDarkScheme =
    ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 2, 112, 57));


void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkScheme,
        cardTheme: const CardTheme().copyWith(
            color: kDarkScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kDarkScheme.primaryContainer),
          ),
      ),
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kColorScheme.onPrimaryContainer,
              foregroundColor: kColorScheme.primaryContainer),
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kColorScheme.primaryContainer),
          ),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: kColorScheme.onSecondaryContainer,
                  fontSize: 16))),
      debugShowCheckedModeBanner: false,
      home: const Expenses(),
    ),
  );
}
