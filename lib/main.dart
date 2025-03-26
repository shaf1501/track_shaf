import 'package:flutter/material.dart';

void main() {
  runApp(const StyledTextApp());
}

class StyledTextApp extends StatelessWidget {
  const StyledTextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TextStyleScreen(),
    );
  }
}

class TextStyleScreen extends StatelessWidget {
  const TextStyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tanjid Ahammed Shafin',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 12, 5, 110),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Tanjid Ahammed Shafin',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Tanjid Ahammed Shafin',
              style: TextStyle(
                fontSize: 10,
                decoration: TextDecoration.underline,
                color: Color.fromARGB(255, 154, 55, 147),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Mobile Application',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}