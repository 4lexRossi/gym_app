import 'package:flutter/material.dart';
import 'package:gym_app/models/exercise.dart';

class ExerciseList extends StatelessWidget {
  final List<Exercise> exercises;
  final void Function(String) onRemove;

  const ExerciseList(this.exercises, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return exercises.isEmpty
        ? Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'No exercise registered',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemCount: exercises.length,
            itemBuilder: (context, index) {
              final ex = exercises[index];
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Column(
                          children: [
                            const Text('Sets'),
                            Text('${ex.set}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    ex.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    'Weight: ${ex.weight.toStringAsFixed(2)}kg',
                  ),
                  trailing: IconButton(
                    color: Colors.redAccent,
                    onPressed: () => onRemove(ex.id),
                    icon: const Icon(Icons.delete),
                  ),
                ),
              );
            },
          );
  }
}
