import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select a Calculator"), backgroundColor: Colors.teal),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          menuButton(context, "Friendship Calculator", "/friendship"),
          menuButton(context, "Currency Converter", "/currency"),
          menuButton(context, "Temperature Converter", "/temperature"),
          menuButton(context, "BMI Calculator", "/bmi"),
          menuButton(context, "Length Converter", "/length"),
          menuButton(context, "Area Converter", "/area"),
          menuButton(context, "Volume Converter", "/volume"),
          menuButton(context, "Weight & Mass Converter", "/weight"),
          menuButton(context, "Time Converter (Belgium to Pakistan)", "/time_belgium_pakistan"),
          menuButton(context, "Age Calculator", "/age"),
          menuButton(context, "Time Converter (H to M or M to Sec)", "/time_hm_sec"),
        ],
      ),
    );
  }

  Widget menuButton(BuildContext context, String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, route),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          backgroundColor: Colors.tealAccent,
        ),
        child: Text(title, style: const TextStyle(fontSize: 18, color: Colors.black)),
      ),
    );
  }
}
