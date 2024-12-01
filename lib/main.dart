import 'package:flutter/material.dart';
import 'listSubjects.dart';

void main() {
  runApp(MyApp());
}

Color myCustomColor2 = Color(0xFF42587F);

ThemeData theme = ThemeData(
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 18, color: Colors.white70),
  ),
  appBarTheme: const AppBarTheme(
    color: Color(0xFFF9DB6D),
    iconTheme: IconThemeData(color: Colors.grey),
    titleTextStyle: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),

  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: myCustomColor2,
    brightness: Brightness.light,
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      darkTheme: theme,
      themeMode: ThemeMode.system,
      home: ListSubjects(),
    );
  }
}