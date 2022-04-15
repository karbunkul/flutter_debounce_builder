import 'package:debounce_builder/debounce_builder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debounce timer'),
      ),
      body: DebounceBuilder(
        delay: const Duration(milliseconds: 250),
        builder: (context, debounce) {
          return TextField(
            onChanged: (value) => debounce(() => print(value)),
          );
        },
      ),
    );
  }
}
