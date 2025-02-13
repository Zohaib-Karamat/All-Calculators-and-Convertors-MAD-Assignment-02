import 'package:flutter/material.dart';

class WeightConverterScreen extends StatefulWidget {
  const WeightConverterScreen({super.key});

  @override
  _WeightConverterScreenState createState() => _WeightConverterScreenState();
}

class _WeightConverterScreenState extends State<WeightConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  double _kilograms = 0.0;
  static const double conversionFactor = 0.453592; // 1 lb = 0.453592 kg

  void _convertWeight() {
    double pounds = double.tryParse(_controller.text) ?? 0.0;
    setState(() {
      _kilograms = pounds * conversionFactor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pounds to Kilograms"), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter weight in pounds",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convertWeight,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: const Text("Convert", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),
            Text(
              "Equivalent in Kilograms: $_kilograms kg",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
          ],
        ),
      ),
    );
  }
}
