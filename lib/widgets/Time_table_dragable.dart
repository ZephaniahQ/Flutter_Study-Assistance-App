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
  double _maxHeight = 300.0; // Maximum height for the TimeTable
  double _currentHeight = 300.0; // Current height of the TimeTable

  void dayForward() {
    if (todayIndex == 4) {
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
        todayIndex = 4;
      });
    } else {
      setState(() {
        todayIndex--;
      });
    }
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      _currentHeight += details.delta.dy;
      _currentHeight =
          _currentHeight.clamp(0.0, _maxHeight); // Clamp within limits
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      // Use Stack for overlapping elements
      children: [
        GestureDetector(
          // Capture drag on entire Stack
          onVerticalDragUpdate: _onDragUpdate,
          child: Column(
            mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
            children: <Widget>[
              Row(
                children: [
                  Flexible(
                    // Use Flexible with loose fit
                    fit: FlexFit.loose,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.rectangle,
                        border: BorderDirectional(
                          top: BorderSide(color: Colors.white),
                          bottom: BorderSide.none,
                        ),
                      ),
                      child: const Text(
                        "Time Table",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                ),
                width: double.infinity,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CupertinoButton(
                      onPressed: dayBackward,
                      child: const Text(
                        "<",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      days[todayIndex].dayName,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    CupertinoButton(
                      onPressed: dayForward,
                      child: const Text(
                        ">",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                // Use Flexible with loose fit for subject list container
                fit: FlexFit.loose,
                child: IgnorePointer(
                  // Wrap content to ignore touches
                  child: Container(
                    padding: const EdgeInsets.only(
                        bottom: 4.0), // Add bottom padding
                    height: _currentHeight, // Dynamic height based on drag
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Column(
                      children: days[todayIndex].getSubjectsList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          // Position black bar at bottom
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            // Make black bar draggable
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
      ],
    );
  }
}
