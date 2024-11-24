import 'package:flutter/material.dart';
import 'package:gym_app/components/exercise_form.dart';
import 'package:gym_app/components/exercise_list.dart';
import 'package:gym_app/models/exercise.dart';

class ExerciseUser extends StatefulWidget {
  @override
  _ExerciseUserState createState() => _ExerciseUserState();
}

class _ExerciseUserState extends State<ExerciseUser> {
  final _exercises = [
    Exercise(id: 'E1', title: 'title1', set: 3, weight: 25.2),
    Exercise(id: 'E2', title: 'title2', set: 4, weight: 15.4)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExerciseList(_exercises),
        ExerciseForm(),
      ],
    );
  }
}
