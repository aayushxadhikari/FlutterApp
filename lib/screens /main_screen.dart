import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Concepts'),
        backgroundColor: const Color(0xFF283593),
      ),
      body: ListView(
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/widgets');
            },
            child: const Text('Widgets'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/ui_components');
            },
            child: const Text('UI Components'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/design_animation');
            },
            child: const Text('Design and Animation'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/forms_gestures');
            },
            child: const Text('Forms and Gestures'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/accessing_device');
            },
            child: const Text('Accessing Device'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/advanced_flutter');
            },
            child: const Text('Advanced Flutter Concepts'),
          ),
        ],
      ),
    );
  }
}
