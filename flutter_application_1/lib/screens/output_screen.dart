import 'package:flutter/material.dart';

class OutputScreen extends StatelessWidget {
  OutputScreen({Key? key}) : super(key: key);

  double calculateGPA(List<Map<String, dynamic>> courses) {
    double totalPoints = 0;
    int totalCredits = 0;

    for (var course in courses) {
      int credits = course["credits"];
      double gradePoint = _gradePoints[course["grade"]] ?? 0.0;
      totalPoints += credits * gradePoint;
      totalCredits += credits;
    }

    return totalCredits == 0 ? 0.0 : totalPoints / totalCredits;
  }

  final Map<String, double> _gradePoints = {
    'A+': 4.0,
    'A': 4.0,
    'A-': 3.7,
    'B+': 3.3,
    'B': 3.0,
    'B-': 2.7,
    'C+': 2.3,
    'C': 2.0,
    'C-': 1.7,
    'D+': 1.3,
    'D': 1.0,
    'E': 0.0,
  };

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> courses = ModalRoute.of(context)!
        .settings
        .arguments as List<Map<String, dynamic>>;
    final double gpa = calculateGPA(courses);

    return Scaffold(
      appBar: AppBar(title: const Text("GPA Result")),
      body: Center(
        child: Text(
          "Your GPA: ${gpa.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
