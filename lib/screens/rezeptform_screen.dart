import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/einheit.dart';
import '../models/zutat.dart';

class RezeptFormScreen extends StatefulWidget {
  const RezeptFormScreen({Key? key}) : super(key: key);

  static String id = 'rezepthinzufuegen';

  @override
  State<RezeptFormScreen> createState() => _RezeptFormScreenState();
}

class _RezeptFormScreenState extends State<RezeptFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<Zutat> _zutaten = <Zutat>[Zutat(0)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rezepte bearbeiten'),
        actions: [
          IconButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Daten werden gespeichert')));
                }
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    return value == null || value.isEmpty || value.length < 3
                        ? 'Der Rezeptname ist leer oder zu kurz (mind. 3 Zeichen)'
                        : null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Fundort'),
                  validator: (value) {
                    return value == null || value.isEmpty || value.length < 3
                        ? 'Der Fundort darf nicht leer sein.'
                        : null;
                  },
                ),
                const SizedBox(height: 25.0),
                const Text(
                  'Zutat hinzufügen',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: _inputListView()),
              ],
            ),
          )),
    );
  }

  Widget _inputListView() {
    final rowFormKey = GlobalKey<FormState>();
    return ListView.builder(
      itemCount: _zutaten.length,
      itemBuilder: (BuildContext context, int index) {
        var zutat = _zutaten[index];
        return Container(
          margin: const EdgeInsets.all(5),
          child: Form(
            key: rowFormKey,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Produkt'),
                    validator: (value) {
                      return value == null || value.isEmpty || value.length < 3
                          ? ''
                          : null;
                    },
                    onChanged: (String? newValue) {
                      setState(() {
                        _zutaten[index].name = newValue;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Menge'),
                    initialValue: zutat.menge.toString(),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      return value == null || int.parse(value) <= 0
                          ? ''
                          : null;
                    },
                    onChanged: (String? newValue) {
                      setState(() {
                        _zutaten[index].menge = newValue as int;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: DropdownButton<Einheit>(
                    value: _zutaten[index].einheit,
                    items: Einheit.values
                        .map<DropdownMenuItem<Einheit>>((Einheit value) {
                      return DropdownMenuItem<Einheit>(
                        value: value,
                        child: Text(value.name),
                      );
                    }).toList(),
                    onChanged: (Einheit? newValue) {
                      setState(() {
                        _zutaten[index].einheit = newValue;
                      });
                    },
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: index == _zutaten.length - 1
                        ? Colors.green
                        : Colors.red,
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {
                    if (rowFormKey.currentState!.validate()) {
                      setState(() {
                        if (_zutaten.length - 1 == index) {
                          _zutaten.add(Zutat(0));
                        } else {
                          _zutaten.removeAt(index);
                        }
                      });
                    }
                  },
                  child: Icon(
                      index == _zutaten.length - 1 ? Icons.add : Icons.remove),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
