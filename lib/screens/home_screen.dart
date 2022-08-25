import 'package:flutter/material.dart';
import 'package:rezeptbuch/screens/rezeptbuch_screen.dart';

import 'einkaufsliste_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String id = 'home';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rezeptbuch'),
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.book)),
            Tab(icon: Icon(Icons.shopping_basket)),
          ]),
        ),
        body: const TabBarView(
            children: [RezeptbuchScreen(), EinkaufslisteScreen()]),
      ),
    );
  }
}