import 'package:flutter/material.dart';
import '../widgets/widget_button.dart';

class WidgetsScreen extends StatelessWidget {
  const WidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets Screen'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: const [
          WidgetButton(label: 'Bottom Navigation Bar', widget: Placeholder()),
          WidgetButton(label: 'ClipRRect Widget', widget: Placeholder()),
          WidgetButton(label: 'Drawer Widget', widget: Placeholder()),
          WidgetButton(label: 'ClipRect Widget', widget: Placeholder()),
          WidgetButton(label: 'Opacity Widget', widget: Placeholder()),
          WidgetButton(label: 'Rotated Box Widget', widget: Placeholder()),
          WidgetButton(label: 'RichText Widget', widget: Placeholder()),
          WidgetButton(label: 'OctoImage Widget', widget: Placeholder()),
          WidgetButton(label: 'AppBar Widget', widget: Placeholder()),
        ],
      ),
    );
  }
}
