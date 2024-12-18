import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String label;
  final String routeName;

  const NavButton({super.key, required this.label, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, routeName),
        child: Text(label),
      ),
    );
  }
}
