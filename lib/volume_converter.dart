import 'package:flutter/material.dart';

class VolumeConverterScreen extends StatefulWidget {
  const VolumeConverterScreen({super.key});

  @override
  _VolumeConverterScreenState createState() => _VolumeConverterScreenState();
}

class _VolumeConverterScreenState extends State<VolumeConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  double _cubicMeters = 0.0;
  static const double conversionFactor = 0.0283168; // 1 cubic foot = 0.0283168 cubic meters

  void _convertVolume() {
    double cubicFeet = double.tryParse(_controller.text) ?? 0.0;
    setState(() {
      _cubicMeters = cubicFeet * conversionFactor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cubic Feet to Cubic Meters"), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter volume in cubic feet",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convertVolume,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: const Text("Convert", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),
            Text(
              "Equivalent in Cubic Meters: $_cubicMeters m³",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
          ],
        ),
      ),
    );
  }
}
