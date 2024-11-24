import 'package:flutter/material.dart';

class ExerciseForm extends StatelessWidget {
  final titleController = TextEditingController();
  final setController = TextEditingController();
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Exercise',
              ),
            ),
            TextFormField(
              controller: setController,
              decoration: const InputDecoration(
                labelText: 'Sets',
              ),
            ),
            TextFormField(
              controller: weightController,
              decoration: const InputDecoration(
                labelText: 'Weight',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    print(titleController);
                    print(setController);
                    print(weightController);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    backgroundColor: Colors.grey[200],
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 24.0),
                  ),
                  child: const Text('New Exercise'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
