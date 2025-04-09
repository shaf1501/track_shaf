import 'package:flutter/material.dart';

void main() {
  runApp(const CustomAppBarApp());
}

class CustomAppBarApp extends StatelessWidget {
  const CustomAppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom AppBar',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const CustomAppBarScreen(),
    );
  }
}

class CustomAppBarScreen extends StatelessWidget {
  const CustomAppBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            Image.asset(
              'assets/image/logo1.png', // Replace with your logo asset path
              height: 30,
            ),
            const SizedBox(width: 10),
            const Text(
              'Custom AppBar',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle menu action
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome to the app with a custom AppBar!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
