import 'package:flutter/material.dart';
import 'package:gym_app/models/exercise.dart';

class ExerciseList extends StatelessWidget {
  final List<Exercise> exercises;

  ExerciseList(this.exercises);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: exercises.map((ex) {
        return Card(
            child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 1, 98, 177),
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              padding: const EdgeInsets.all(10),
              child: Text(
                'Séries ${ex.set}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 1, 98, 177),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ex.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Peso ${ex.weight.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            )
          ],
        ));
      }).toList(),
    );
  }
}
