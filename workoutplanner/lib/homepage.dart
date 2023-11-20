import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'workout.dart';
import 'plan.dart';
import 'exercise.dart';
import 'pages/menu.dart';

Exercise squat = Exercise("Squat");
Exercise benchPress = Exercise("Bench Press");
Exercise cableRow = Exercise("Cable Row");
Exercise overheadPress = Exercise("Overhead Press");
Exercise deadlift = Exercise("Deadlift");
Exercise latPulldown = Exercise("Lat Pulldown");

List exerciseBacklog = [squat, benchPress, cableRow, overheadPress, deadlift, latPulldown];

Workout workoutA = Workout("Day 1", [squat, benchPress, cableRow]);
Workout workoutB = Workout("Day 2", [overheadPress, deadlift, latPulldown]);
Workout workoutC = Workout("Day 3", [benchPress, squat, cableRow]);
Workout workoutD = Workout("Day 4", [deadlift, overheadPress, latPulldown]);

Plan gzclp = Plan("GZCLP", [workoutA, workoutB, workoutC, workoutD]);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(children: [for(var workout in gzclp.workouts) Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [ElevatedButton(
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
                    child: Text(exercise.name),
                  ),
                ],
              ),
            ),],
          ),
        ),],
        ),
      ),
    ),
    MenuPage(),
  ];

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
      body: _pages[_selectedIndex],
      bottomNavigationBar: GNav(
        rippleColor: Colors.grey,
        hoverColor: Colors.grey,
        gap: 8,
        activeColor: Colors.black,
        iconSize: 24,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        duration: const Duration(milliseconds: 400),
        tabBackgroundColor: Colors.grey,
        color: Colors.black,
        tabs: const [
          GButton(
            text: "Home",
            icon: Icons.home
          ),
          GButton(
            text: "Menu",
            icon: Icons.menu
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
