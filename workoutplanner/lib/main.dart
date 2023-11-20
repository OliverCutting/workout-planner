import 'package:flutter/material.dart';
import 'workout.dart';
import 'plan.dart';

void main() => runApp(MaterialApp(home: Home()));

Workout workoutA = Workout("Day 1", ["Squat", "Bench Press", "Cable Row"]);
Workout workoutB = Workout("Day 2", ["Overhead Press", "Deadlift", "Lat Pulldown"]);
Workout workoutC = Workout("Day 3", ["Bench Press", "Squat", "Cable Row"]);
Workout workoutD = Workout("Day 4", ["Deadlift", "Overhead Press", "Lat Pulldown"]);

Plan gzclp = Plan("GZCLP", [workoutA, workoutB, workoutC, workoutD]);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text(
          'Workout Planner',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            fontFamily: 'Oswald'),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(children: [for(var workout in gzclp.workouts) Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [ ElevatedButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey[850],
                minimumSize: const Size.fromHeight(100),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20)
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(workout.name),
                  ),
                  const Divider(color: Colors.white,),
                  for(var exercise in workout.exercises) Align(
                    alignment: Alignment.centerLeft,
                    child: Text(exercise),
                  ),
                ],
              ),
            ),],
          ),
        ),],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: 'My Workouts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.blue[600],
        unselectedItemColor: Colors.grey[900],
      ),
    );
  }
}
