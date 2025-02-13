import 'package:flutter/material.dart';

class LengthConverterScreen extends StatefulWidget {
  const LengthConverterScreen({super.key});

  @override
  _LengthConverterScreenState createState() => _LengthConverterScreenState();
}

class _LengthConverterScreenState extends State<LengthConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  double _meters = 0.0;
  static const double conversionFactor = 0.3048; // 1 foot = 0.3048 meters

  void _convertLength() {
    double feet = double.tryParse(_controller.text) ?? 0.0;
    setState(() {
      _meters = feet * conversionFactor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Feet to Meters Converter"), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter length in feet",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convertLength,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: const Text("Convert", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),
            Text(
              "Equivalent in Meters: $_meters m",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
          ],
        ),
      ),
    );
  }
}
