import 'package:flutter/material.dart';
import 'package:gym_app/components/exercise_form.dart';
import 'package:gym_app/components/exercise_list.dart';
import 'package:gym_app/components/exercise_user.dart';
import 'package:gym_app/models/exercise.dart';

main() => runApp(const MyGym());

class MyGym extends StatelessWidget {
  const MyGym({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Training'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: const Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('Graph'),
            ),
          ),
          ExerciseUser(),
        ],
      ),
    );
  }
}
