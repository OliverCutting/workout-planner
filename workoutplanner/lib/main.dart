import 'package:flutter/material.dart';
import 'workout.dart';
import 'plan.dart';

void main() => runApp(MaterialApp(home: Home()));

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
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey[850],
                minimumSize: const Size.fromHeight(100),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(Workout.name),
                  ),
                  const Divider(color: Colors.white,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(Workout.exercises[0]),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(Workout.exercises[1]),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(Workout.exercises[2]),
                  ),
                ],
              ),
            ),
          ],
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
