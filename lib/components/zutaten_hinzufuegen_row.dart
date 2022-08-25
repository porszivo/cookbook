import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/einheit.dart';
import '../models/zutat.dart';

class ZutatenHinzufuegenRow extends StatelessWidget {
  ZutatenHinzufuegenRow(
      {Key? key,
      required this.zutatAction,
      required this.latestRow,
      required this.zutat})
      : super(key: key);

  final VoidCallback zutatAction;

  late bool latestRow;

  final Zutat zutat;

  @override
  Widget build(BuildContext context) {
    return Row(children: [],);
  }

  void setLatestRow(bool latestRow) {
    this.latestRow = latestRow;
  }
}
