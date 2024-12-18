import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {
  final String label;

  const TextButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(label),
      ),
    );
  }
}
