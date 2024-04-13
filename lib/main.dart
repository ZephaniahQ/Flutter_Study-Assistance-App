import 'package:time_table/pages/Assignments_page.dart';
import 'package:time_table/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/assignments': (context) => const AssignmentsPage(),
      },
    );
  }
}
