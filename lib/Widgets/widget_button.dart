import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  final String label;
  final Widget widget;

  const WidgetButton({required this.label, required this.widget, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3), // Changes position of the shadow
            ),
          ],
          border: Border.all(
            color: Colors.blueAccent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.widgets_outlined,
              color: Colors.blueAccent,
              size: 28,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
