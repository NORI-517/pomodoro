import 'package:flutter/material.dart';
import '../screens/main_screen.dart';
import '../utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Focus Timer',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              actionsIconTheme: IconThemeData(color: white, size: 27))),
      home: const MainScreen(),
    );
  }
}
