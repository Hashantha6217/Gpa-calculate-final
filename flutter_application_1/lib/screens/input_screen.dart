import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> _courses = List.generate(
    6,
    (index) => {"courseName": "", "credits": 0, "grade": ""},
  );

  final Map<String, double> gradePoints = {
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pushNamed(
        context,
        '/output',
        arguments: _courses,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter Course Details"),
        backgroundColor: Colors.deepPurple, // AppBar color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                ..._courses.asMap().entries.map((entry) {
                  int index = entry.key;
                  return Card(
                    color: Colors.blue[50], // Card background color
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Course ${index + 1}:",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color:
                                  Color.fromARGB(255, 22, 20, 26), // Text color
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Course Name",
                              labelStyle:
                                  const TextStyle(color: Colors.deepPurple),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                              ),
                            ),
                            validator: (value) => value == null || value.isEmpty
                                ? "Please enter course name"
                                : null,
                            onSaved: (value) =>
                                _courses[index]["courseName"] = value,
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Credits",
                              labelStyle: const TextStyle(
                                  color: Color.fromARGB(255, 43, 93, 200)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 195, 145, 6)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) =>
                                value == null || int.tryParse(value) == null
                                    ? "Please enter valid credits"
                                    : null,
                            onSaved: (value) =>
                                _courses[index]["credits"] = int.parse(value!),
                          ),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: "Grade",
                              labelStyle:
                                  const TextStyle(color: Colors.deepPurple),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 58, 183, 81)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color.fromARGB(
                                        255, 162, 183, 58)),
                              ),
                            ),
                            items: gradePoints.keys
                                .map((grade) => DropdownMenuItem(
                                      value: grade,
                                      child: Text(
                                        grade,
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 84, 125, 171)),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) => setState(() {
                              _courses[index]["grade"] = value!;
                            }),
                            validator: (value) =>
                                value == null ? "Please select a grade" : null,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text("Calculate GPA"),
                  style: ElevatedButton.styleFrom(
                    // Button background color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
