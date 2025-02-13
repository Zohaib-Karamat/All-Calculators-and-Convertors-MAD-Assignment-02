import 'package:flutter/material.dart';

class TimeConverterScreen extends StatefulWidget {
  const TimeConverterScreen({super.key});

  @override
  _TimeConverterScreenState createState() => _TimeConverterScreenState();
}

class _TimeConverterScreenState extends State<TimeConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  String _convertedTime = "";
  static const int timeDifference = 4; // CET to PKT (4 hours difference in winter), CEST is 3 hours

  void _convertTime() {
    try {
      List<String> parts = _controller.text.split(":");
      if (parts.length != 2) throw Exception("Invalid format");

      int hours = int.parse(parts[0]);
      int minutes = int.parse(parts[1]);

      if (hours < 0 || hours > 23 || minutes < 0 || minutes > 59) {
        throw Exception("Invalid time range");
      }

      int convertedHours = (hours + timeDifference) % 24;
      setState(() {
        _convertedTime = "${convertedHours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')} PKT";
      });
    } catch (e) {
      setState(() {
        _convertedTime = "Invalid input! Enter HH:MM format.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Belgium to Pakistan Time"), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter time in Belgium (HH:MM)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convertTime,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: const Text("Convert", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),
            Text(
              _convertedTime,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
          ],
        ),
      ),
    );
  }
}
