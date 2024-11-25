import 'package:flutter/material.dart';
import 'package:gym_app/models/day_exercise.dart';

class DayList extends StatelessWidget {
  late final List<DayExercise> daylist = [
    DayExercise(dayName: 'Monday', dayNumber: 1),
    DayExercise(dayName: 'Tuesday', dayNumber: 2),
    DayExercise(dayName: 'Wenesday', dayNumber: 3),
    DayExercise(dayName: 'Friday', dayNumber: 4),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: daylist.length,
        itemBuilder: (context, index) {
          final dl = daylist[index];
          return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 5,
              ),
              child: Row(
                children: [
                  Text(
                    dl.dayName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    dl.dayNumber.toString(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ));
        });
  }
}
