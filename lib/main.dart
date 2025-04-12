import 'package:flutter/material.dart';

void main() {
  runApp(const DateTimePickerApp());
}

class DateTimePickerApp extends StatelessWidget {
  const DateTimePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date & Time Picker',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const DateTimePickerScreen(),
    );
  }
}

class DateTimePickerScreen extends StatefulWidget {
  const DateTimePickerScreen({super.key});

  @override
  State<DateTimePickerScreen> createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Date & Time Picker')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: _pickDate,
                child: const Text('Pick a Date'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickTime,
                child: const Text('Pick a Time'),
              ),
              const SizedBox(height: 20),
              Text(
                _selectedDate != null
                    ? 'Selected Date: ${_selectedDate!.toLocal()}'.split(' ')[0]
                    : 'No date selected',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                _selectedTime != null
                    ? 'Selected Time: ${_selectedTime!.format(context)}'
                    : 'No time selected',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
