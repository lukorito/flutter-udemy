import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: const Text("I am poor"),
      ),
      body: const Center(
        child: Image(
          image: AssetImage('images/coffee.jpg'),
        ),
      ),
      backgroundColor: Colors.amberAccent,
    ),
  ));
}
