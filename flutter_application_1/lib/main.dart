import 'package:flutter/material.dart';
import 'screens/input_screen.dart'; // ✅ Correct import
import 'screens/output_screen.dart'; // ✅ Correct import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // ✅ Added key parameter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPA Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const InputScreen(), // ✅ Correct class name
        '/output': (context) => OutputScreen(), // ✅ Correct class name
      },
    );
  }
}
