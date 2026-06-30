import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const StreamControllerPracticeApp());
}

class StreamControllerPracticeApp extends StatelessWidget {
  const StreamControllerPracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 29',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      home: const StreamControllerPage(),
    );
  }
}

class StreamControllerPage extends StatefulWidget {
  const StreamControllerPage({super.key});

  @override
  State<StreamControllerPage> createState() {
    return _StreamControllerPageState();
  }
}

class _StreamControllerPageState extends State<StreamControllerPage> {
  final StreamController<int> counterController = StreamController<int>();

  int counter = 0;

  @override
  void initState() {
    super.initState();

    counterController.add(counter);
  }

  void increaseCounter() {
    counter++;
    counterController.add(counter);
  }

  void decreaseCounter() {
    counter--;
    counterController.add(counter);
  }

  void resetCounter() {
    counter = 0;
    counterController.add(counter);
  }

  void addError() {
    counterController.addError('Manual stream error');
  }

  @override
  void dispose() {
    counterController.close();
    super.dispose();
  }

  Widget buildCounter(int value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.stream,
          size: 90,
        ),

        const SizedBox(height: 20),

        const Text(
          'StreamController Counter',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        Text(
          '$value',
          style: const TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 30),

        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: decreaseCounter,
                child: const Text('-'),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: ElevatedButton(
                onPressed: increaseCounter,
                child: const Text('+'),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: resetCounter,
                child: const Text('Reset'),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: OutlinedButton(
                onPressed: addError,
                child: const Text('Add Error'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildError(Object error) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error,
          size: 90,
        ),

        const SizedBox(height: 20),

        Text(
          'Error: $error',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        ElevatedButton(
          onPressed: resetCounter,
          child: const Text('Reset Stream'),
        ),
      ],
    );
  }

  Widget buildStreamBody() {
    return StreamBuilder<int>(
      stream: counterController.stream,
      initialData: counter,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return buildError(snapshot.error!);
        }

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final value = snapshot.data!;

        return buildCounter(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 29: StreamController'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: buildStreamBody(),
      ),
    );
  }
}