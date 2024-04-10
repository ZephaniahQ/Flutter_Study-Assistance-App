import 'package:time_table/classes/subject.dart';
import 'package:flutter/material.dart';

class Day {
  List<Subject>? subjects = [];
  String dayName;

  Day({required this.dayName});

  void addSubject(Subject subject) {
    subjects?.add(subject);
  }

  List<Widget> getSubjectsList() {
    MaterialColor rowColor = Colors.yellow;
    MaterialColor getColor() {
      rowColor = rowColor == Colors.yellow ? Colors.lightBlue : Colors.yellow;
      return rowColor;
    }

    return subjects!.isEmpty // Handle empty list gracefully
        ? [
            const Center(
              child: Text(
                "No subjects for this day.",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ]
        : subjects!
            .map((subject) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: getColor()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "${subject.subject}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${subject.timing}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ))
            .toList();
  }
}
