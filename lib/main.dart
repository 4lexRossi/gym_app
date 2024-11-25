import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gym_app/components/exercise_form.dart';
import 'package:gym_app/components/exercise_list.dart';
import 'package:gym_app/models/day_exercise.dart';
import 'package:gym_app/models/exercise.dart';

main() => runApp(const MyGym());

class MyGym extends StatelessWidget {
  const MyGym({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData customTheme = ThemeData();

    return MaterialApp(
      home: const MyHomePage(),
      theme: customTheme.copyWith(
        colorScheme: customTheme.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        textTheme: customTheme.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;
  final List<Exercise> _exercises = [
    Exercise(id: 'E1', title: 'title1', set: 3, weight: 25.2),
    Exercise(id: 'E2', title: 'title2', set: 4, weight: 15.4),
    Exercise(id: 'E1', title: 'title1', set: 3, weight: 25.2),
    Exercise(id: 'E2', title: 'title2', set: 4, weight: 15.4),
    Exercise(id: 'E1', title: 'title1', set: 3, weight: 25.2),
    Exercise(id: 'E2', title: 'title2', set: 4, weight: 15.4),
    Exercise(id: 'E1', title: 'title1', set: 3, weight: 25.2),
    Exercise(id: 'E2', title: 'title2', set: 4, weight: 15.4),
    Exercise(id: 'E1', title: 'title1', set: 3, weight: 25.2),
    Exercise(id: 'E2', title: 'title2', set: 4, weight: 15.4),
  ];

  final List<DayExercise> dayExercise = [
    DayExercise(dayName: 'Monday', dayNumber: 1),
    DayExercise(dayName: 'Tuesday', dayNumber: 2),
    DayExercise(dayName: 'Wenesday', dayNumber: 3),
    DayExercise(dayName: 'Friday', dayNumber: 4),
  ];

  _addExercise(String title, num set, double weight) {
    final newExercise = Exercise(
      id: Random().nextDouble().toString(),
      title: title,
      set: set,
      weight: weight,
    );

    if (title.isEmpty || set <= 0) {
      return;
    }

    setState(() {
      _exercises.add(newExercise);
    });

    Navigator.of(context).pop();
  }

  _removeExercise(String id) {
    setState(() {
      _exercises.removeWhere((ex) => ex.id == id);
    });
  }

  _openExerciseModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return ExerciseForm(_addExercise);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Personal Training'),
      actions: [
        IconButton(
          onPressed: () => _openExerciseModal(context),
          icon: const Icon(Icons.add),
        )
      ],
    );

    final availableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.fitness_center_outlined),
            label: dayExercise[0].dayName,
          ),
          NavigationDestination(
            icon: const Icon(Icons.fitness_center_outlined),
            label: dayExercise[1].dayName,
          ),
          NavigationDestination(
            icon: const Icon(Icons.fitness_center_outlined),
            label: dayExercise[2].dayName,
          ),
          NavigationDestination(
            icon: const Icon(Icons.fitness_center_outlined),
            label: dayExercise[3].dayName,
          ),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            _page = index;
          });
        },
        animationDuration: const Duration(milliseconds: 100),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_page == 0)
                  Column(
                    children: [
                      Text(dayExercise[0].dayName),
                      SizedBox(
                        height: availableHeight * 0.85,
                        child: ExerciseList(_exercises, _removeExercise),
                      ),
                    ],
                  ),
                if (_page == 1)
                  Column(
                    children: [
                      Text(dayExercise[1].dayName),
                      SizedBox(
                        height: availableHeight * 0.85,
                        child: ExerciseList(_exercises, _removeExercise),
                      ),
                    ],
                  ),
                if (_page == 2)
                  Column(
                    children: [
                      Text(dayExercise[2].dayName),
                      SizedBox(
                        height: availableHeight * 0.85,
                        child: ExerciseList(_exercises, _removeExercise),
                      ),
                    ],
                  ),
                if (_page == 3)
                  Column(
                    children: [
                      Text(dayExercise[3].dayName),
                      SizedBox(
                        height: availableHeight * 0.85,
                        child: ExerciseList(_exercises, _removeExercise),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openExerciseModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
