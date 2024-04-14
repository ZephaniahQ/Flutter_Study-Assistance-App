import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_table/classes/day.dart';
import 'package:time_table/classes/timetable.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  List<Day> days = getDays(); // List of Day objects
  int todayIndex = DateTime.now().weekday - 1; // Today's day index

  void dayForward() {
    if (todayIndex == 6) {
      setState(() {
        todayIndex = 0;
      });
    } else {
      setState(() {
        todayIndex++;
      });
    }
  }

  void dayBackward() {
    if (todayIndex == 0) {
      setState(() {
        todayIndex = 6;
      });
    } else {
      setState(() {
        todayIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.rectangle,
                border: BorderDirectional(
                    top: BorderSide(color: Colors.white),
                    bottom: BorderSide.none)),
            child: const Text(
              "Time Table",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ]),
      Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black), color: Colors.white),
        width: double.infinity,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CupertinoButton(
              onPressed: dayBackward,
              child: const Text(
                "<",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              days[todayIndex].dayName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            CupertinoButton(
              onPressed: dayForward,
              child: const Text(
                ">",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      Column(
        children: days[todayIndex].getSubjectsList(),
      ),
      Row(children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.rectangle,
            ),
            child: const Text(
              "⎯⎯⎯⎯⎯⎯ ",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ])
    ]);
  }
}
