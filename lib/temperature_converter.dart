import 'package:flutter/material.dart';

class TemperatureConverterScreen extends StatefulWidget {
  const TemperatureConverterScreen({super.key});

  @override
  _TemperatureConverterScreenState createState() => _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState extends State<TemperatureConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  double _fahrenheit = 0.0;

  void _convertTemperature() {
    double celsius = double.tryParse(_controller.text) ?? 0.0;
    setState(() {
      _fahrenheit = (celsius * 9 / 5) + 32;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Celsius to Fahrenheit"), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter temperature in Celsius",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convertTemperature,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: const Text("Convert", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),
            Text(
              "Equivalent in Fahrenheit: $_fahrenheit°F",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
          ],
        ),
      ),
    );
  }
}
