import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gym_app/components/exercise_form.dart';
import 'package:gym_app/components/exercise_list.dart';
import 'package:gym_app/models/exercise.dart';

main() => runApp(MyGym());

class MyGym extends StatelessWidget {
  const MyGym({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();

    return MaterialApp(
      home: MyHomePage(),
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        textTheme: tema.textTheme.copyWith(
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
  final _exercises = [
    Exercise(id: 'E1', title: 'title1', set: 3, weight: 25.2),
    Exercise(id: 'E2', title: 'title2', set: 4, weight: 15.4),
  ];

  _addExercise(String title, num set, double weight) {
    final newExercise = Exercise(
      id: Random().nextDouble().toString(),
      title: title,
      set: set,
      weight: weight,
    );

    setState(() {
      _exercises.add(newExercise);
    });

    Navigator.of(context).pop();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Training'),
        actions: [
          IconButton(
            onPressed: () => _openExerciseModal(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: double.infinity,
              child: const Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Graph'),
              ),
            ),
            ExerciseList(_exercises),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openExerciseModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
