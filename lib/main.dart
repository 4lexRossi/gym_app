import 'package:flutter/material.dart';

main() => runApp(const MyGym());

class MyGym extends StatelessWidget {
  const MyGym({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Training'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: const Card(
              color: Colors.blue,
              child: Text('Graph'),
              elevation: 5,
            ),
          ),
          const Card(
            child: Text('Training list'),
          )
        ],
      ),
    );
  }
}
