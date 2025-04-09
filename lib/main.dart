import 'package:flutter/material.dart';

void main() {
  runApp(const SwipeableListApp());
}

class SwipeableListApp extends StatelessWidget {
  const SwipeableListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipeable List App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const SwipeableListScreen(),
    );
  }
}

class SwipeableListScreen extends StatefulWidget {
  const SwipeableListScreen({super.key});

  @override
  State<SwipeableListScreen> createState() => _SwipeableListScreenState();
}

class _SwipeableListScreenState extends State<SwipeableListScreen> {
  final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void _editItem(int index) {
    // Handle edit action
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Edit action for ${items[index]}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Swipeable List')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(items[index]),
            background: Container(
              color: Colors.green,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const Icon(Icons.edit, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                _editItem(index);
              } else if (direction == DismissDirection.endToStart) {
                _deleteItem(index);
              }
            },
            child: ListTile(
              title: Text(items[index]),
            ),
          );
        },
      ),
    );
  }
}
