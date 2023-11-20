import 'package:flutter/material.dart';
import 'workout.dart';
import 'plan.dart';
import 'exercise.dart';
import 'homepage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}