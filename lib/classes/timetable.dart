import 'package:time_table/classes/day.dart';
import 'package:time_table/classes/subject.dart';

final List<Day> days = [
  Day(
    dayName: "Monday",
  )
    ..addSubject(Subject(subject: "Discrete Structures", timing: "9-12am"))
    ..addSubject(Subject(subject: "Quran Translation", timing: "1-2pm"))
    ..addSubject(Subject(subject: "Computer Networks", timing: "3-5pm")),
  Day(
    dayName: "Tuesday",
  )
    ..addSubject(Subject(subject: "Arabic", timing: "8:30-9:15am"))
    ..addSubject(
        Subject(subject: "Programing Fundamentals", timing: "9:15-10am"))
    ..addSubject(Subject(subject: "Expository Writing", timing: "10-10:45am"))
    ..addSubject(Subject(subject: "Math Defficiency", timing: "11-11:45")),
  Day(
    dayName: "Wednesday",
  )
    ..addSubject(Subject(subject: "Arabic", timing: "8:30-9:15am"))
    ..addSubject(Subject(subject: "Discrete Structures", timing: "9:15-10am"))
    ..addSubject(Subject(subject: "Quran Translation", timing: "10-10:45am")),
  Day(
    dayName: "Thursday",
  )
    ..addSubject(
        Subject(subject: "Programing Fundamentals", timing: "9:15-10am"))
    ..addSubject(Subject(subject: "Expository Writing", timing: "10-10:45am"))
    ..addSubject(Subject(subject: "Math Defficiency", timing: "11-11:45")),
  Day(
    dayName: "Friday",
  )
    ..addSubject(Subject(subject: "Computer Networks", timing: "9:15-10am"))
    ..addSubject(
        Subject(subject: "Programing Fundamentals Lab", timing: "10-11:30am"))
    ..addSubject(Subject(subject: "Math Defficiency", timing: "11-11:45")),
];

List<Day> getDays() {
  return days; // Simply return the defined days list
}
