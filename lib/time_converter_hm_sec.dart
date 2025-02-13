import 'package:flutter/material.dart';

class TimeConverterHoursMinutesScreen extends StatefulWidget {
  const TimeConverterHoursMinutesScreen({super.key});

  @override
  _TimeConverterHoursMinutesScreenState createState() => _TimeConverterHoursMinutesScreenState();
}

class _TimeConverterHoursMinutesScreenState extends State<TimeConverterHoursMinutesScreen> {
  final TextEditingController _controller = TextEditingController();
  double _convertedTime = 0.0;
  String _conversionType = 'H to M'; // Default conversion type

  void _convertTime() {
    double inputTime = double.tryParse(_controller.text) ?? 0.0;

    setState(() {
      if (_conversionType == 'H to M') {
        _convertedTime = inputTime * 60; // Hours to Minutes
      } else if (_conversionType == 'M to S') {
        _convertedTime = inputTime * 60; // Minutes to Seconds
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Time Converter"), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter Time",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: _conversionType,
              items: ['H to M', 'M to S'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _conversionType = newValue!;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convertTime,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: const Text("Convert", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),
            Text(
              "Converted Time: $_convertedTime",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
          ],
        ),
      ),
    );
  }
}
