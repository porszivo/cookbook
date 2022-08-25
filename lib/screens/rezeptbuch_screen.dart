import 'package:flutter/material.dart';
import 'package:rezeptbuch/screens/rezeptform_screen.dart';

class RezeptbuchScreen extends StatelessWidget {
  const RezeptbuchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('Rezeptbuch'),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(RezeptFormScreen.id);
        },
      ),
    );
  }

}
