// In your DesignAnimationScreen widget
import 'package:flutter/material.dart';

class DesignAnimationScreen extends StatelessWidget {
  const DesignAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design and Animation'),
      ),
      body: ListView(
        children: [
          TextButton(
            onPressed: () {
              // Handle the button press for "Customizing Fonts"
            },
            child: const Text('Customizing Fonts'),
          ),
          TextButton(
            onPressed: () {
              // Handle the button press for "Skeleton Text"
            },
            child: const Text('Skeleton Text'),
          ),
          TextButton(
            onPressed: () {
              // Handle the button press for "Animation in Route Transition"
            },
            child: const Text('Animation in Route Transition'),
          ),
          TextButton(
            onPressed: () {
              // Handle the button press for "Ripple Effect"
            },
            child: const Text('Ripple Effect'),
          ),
          TextButton(
            onPressed: () {
              // Handle the button press for "UI Orientation"
            },
            child: const Text('UI Orientation'),
          ),
          TextButton(
            onPressed: () {
              // Handle the button press for "Physics Simulation in Animation"
            },
            child: const Text('Physics Simulation in Animation'),
          ),
          TextButton(
            onPressed: () {
              // Handle the button press for "Themes"
            },
            child: const Text('Themes'),
          ),
          TextButton(
            onPressed: () {
              // Handle the button press for "Radial Hero Animation"
            },
            child: const Text('Radial Hero Animation'),
          ),
          TextButton(
            onPressed: () {
              // Handle the button press for "Hinge Animation"
            },
            child: const Text('Hinge Animation'),
          ),
          TextButton(
            onPressed: () {
              // Handle the button press for "Lottie Animation"
            },
            child: const Text('Lottie Animation'),
          ),
          TextButton(
            onPressed: () {
              // Handle the button press for "Using Google Fonts"
            },
            child: const Text('Using Google Fonts'),
          ),
          TextButton(
            onPressed: () {
              // Handle the button press for "Auto Size Text"
            },
            child: const Text('Auto Size Text'),
          ),
          TextButton(
            onPressed: () {
              // Handle the button press for "Rotate Transition"
            },
            child: const Text('Rotate Transition'),
          ),
        ],
      ),
    );
  }
}
