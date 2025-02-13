import 'package:flutter/material.dart';

class AreaConverterScreen extends StatefulWidget {
  const AreaConverterScreen({super.key});

  @override
  _AreaConverterScreenState createState() => _AreaConverterScreenState();
}

class _AreaConverterScreenState extends State<AreaConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  double _squareMeters = 0.0;
  static const double conversionFactor = 0.092903; // 1 square foot = 0.092903 square meters

  void _convertArea() {
    double squareFeet = double.tryParse(_controller.text) ?? 0.0;
    setState(() {
      _squareMeters = squareFeet * conversionFactor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Square Feet to Square Meters"), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter area in square feet",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convertArea,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: const Text("Convert", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),
            Text(
              "Equivalent in Square Meters: $_squareMeters m²",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
          ],
        ),
      ),
    );
  }
}
