import '../models/course.dart'; // Add this import

double calculateGPA(List<Course> courses) {
  double totalGradePoints = 0;
  int totalCredits = 0;

  Map<String, double> gradePoints = {
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
    'E': 0.0
  };

  for (var course in courses) {
    double gradePoint = gradePoints[course.grade] ?? 0.0;
    totalGradePoints += gradePoint * course.credit;
    totalCredits += course.credit;
  }

  return totalCredits > 0 ? totalGradePoints / totalCredits : 0.0;
}
