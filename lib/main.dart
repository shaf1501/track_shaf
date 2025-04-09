import 'package:flutter/material.dart';

void main() {
  runApp(const LocalImageApp());
}

class LocalImageApp extends StatelessWidget {
  const LocalImageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Image App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const LocalImageScreen(),
    );
  }
}

class LocalImageScreen extends StatelessWidget {
  const LocalImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Image Display'),
      ),
      body: Center(
        child: Image.asset(
          'assets/image/car_pic.jpeg', // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
