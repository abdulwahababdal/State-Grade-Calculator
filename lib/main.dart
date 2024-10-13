import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final scoreController = TextEditingController();
  String result = '';

  String calculateScore(double score) {
    if (score >= 90) {
      return 'A';
    } else if (score >= 80) {
      return 'B';
    } else if (score >= 75) {
      return 'C';
    } else if (score >= 60) {
      return 'D';
    } else {
      return 'F';
    }
  }

  void _calculate() {
    final double? score = double.tryParse(scoreController.text);
    if (score != null) {
      setState(() {
        result = calculateScore(score);
      });
    } else {
      setState(() {
        result = 'Please enter a valid score';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color customColor = Colors.white;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: const Color.fromARGB(255, 191, 61, 242),
          title: const Text(
            'Grade Calculator',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: customColor,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: scoreController, 
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Type your score',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calculate,
                  child: const Text('Calculate'),
                ),
                const SizedBox(height: 20),
                Text(
                  result,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 191, 61, 242),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
