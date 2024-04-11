import 'package:flutter/material.dart';
import 'package:time_table/widgets/Time_table.dart';
import 'package:time_table/widgets/BottomNav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: const Text('Study Assistance App'),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: const Column(
        children: [
          TimeTable(),
          //BottomNav(),
        ],
      ),
    );
  }
}
