import 'package:flutter/material.dart';
import 'package:time_table/widgets/Time_table.dart';
import 'package:time_table/widgets/BottomNav.dart';

class SubjectList extends StatefulWidget {
  const SubjectList({super.key});

  @override
  State<SubjectList> createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
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
