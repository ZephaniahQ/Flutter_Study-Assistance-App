import 'package:flutter/material.dart';

class ClickAbleCellNav extends StatelessWidget {
  const ClickAbleCellNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
        border: TableBorder
            .all(), // Allows to add a border decoration around your table
        children: [
          TableRow(children: [
            Text('Assignments'),
            Text('Tests'),
          ]),
          TableRow(children: [
            Text(
              'Notes Storage',
            ),
            Text('Random'),
          ]),
        ]);
  }
}
