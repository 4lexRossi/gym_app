import 'package:flutter/material.dart';

class ExerciseForm extends StatefulWidget {
  final void Function(String, num, double) onSubmit;

  const ExerciseForm(this.onSubmit, {super.key});

  @override
  State<ExerciseForm> createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
  final titleController = TextEditingController();

  final setController = TextEditingController();

  final weightController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final set = num.tryParse(setController.text) ?? 0;
    final weight = double.tryParse(weightController.text) ?? 0.0;

    if (title.isEmpty || set <= 0) {
      return;
    }

    widget.onSubmit(title, set, weight);
  }

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
              onFieldSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Exercise',
              ),
            ),
            TextFormField(
              controller: setController,
              onFieldSubmitted: (_) => _submitForm(),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Sets',
              ),
            ),
            TextFormField(
              controller: weightController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onFieldSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Weight',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    final title = titleController.text;
                    final set = num.tryParse(setController.text) ?? 0;
                    final weight =
                        double.tryParse(weightController.text) ?? 0.0;
                    widget.onSubmit(title, set, weight);
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
