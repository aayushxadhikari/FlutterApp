import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  final String label;
  final Widget widget;

  const WidgetButton({super.key, required this.label, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget),
          );
        },
        child: Text(label),
      ),
    );
  }
}
