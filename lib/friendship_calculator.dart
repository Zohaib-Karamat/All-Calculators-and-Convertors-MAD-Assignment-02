import 'package:flutter/material.dart';
import 'dart:math';

class FriendshipCalculatorScreen extends StatefulWidget {
  const FriendshipCalculatorScreen({super.key});

  @override
  _FriendshipCalculatorScreenState createState() => _FriendshipCalculatorScreenState();
}

class _FriendshipCalculatorScreenState extends State<FriendshipCalculatorScreen> {
  final TextEditingController _nameController1 = TextEditingController();
  final TextEditingController _nameController2 = TextEditingController();
  int _friendshipScore = 0;

  void _calculateFriendship() {
    String name1 = _nameController1.text.trim();
    String name2 = _nameController2.text.trim();

    if (name1.isNotEmpty && name2.isNotEmpty) {
      setState(() {
        _friendshipScore = (name1.length + name2.length + Random().nextInt(50)) % 101;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Friendship Calculator"), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController1,
              decoration: const InputDecoration(labelText: "Enter First Name", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _nameController2,
              decoration: const InputDecoration(labelText: "Enter Second Name", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              onPressed: _calculateFriendship,
              child: const Text(
                "Calculate Friendship",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Friendship Score: $_friendshipScore%",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}
