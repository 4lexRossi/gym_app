import 'package:flutter/material.dart';
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
  final _exercises = [
    Exercise(id: 'E1', title: 'title1', set: 3, weight: 25.0),
    Exercise(id: 'E2', title: 'title2', set: 4, weight: 15.0)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Training'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          Column(
            children: _exercises.map((ex) {
              return Card(
                child: Text(ex.title),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
