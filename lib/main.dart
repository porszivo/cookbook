import 'package:flutter/material.dart';
import 'package:rezeptbuch/screens/home_screen.dart';
import 'package:rezeptbuch/screens/rezeptform_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (BuildContext context) => const HomeScreen(),
        RezeptFormScreen.id: (BuildContext context) => const RezeptFormScreen(),
      },
    );
  }
}
