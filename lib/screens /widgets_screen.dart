import 'package:flutter/material.dart';
import '../widgets/widget_button.dart';

class WidgetsScreen extends StatelessWidget {
  const WidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets Screen'),
      ),
      body: ListView(
        children: [
          WidgetButton(label: 'Bottom Navigation Bar', widget: const Placeholder()),
          WidgetButton(label: 'ClipRRect Widget', widget: const Placeholder()),
          WidgetButton(label: 'Drawer Widget', widget: const Placeholder()),
          WidgetButton(label: 'ClipRect Widget', widget: const Placeholder()),
          WidgetButton(label: 'Opacity Widget', widget: const Placeholder()),
          WidgetButton(label: 'Rotated Box Widget', widget: const Placeholder()),
          WidgetButton(label: 'RichText Widget', widget: const Placeholder()),
          WidgetButton(label: 'OctoImage Widget', widget: const Placeholder()),
          WidgetButton(label: 'AppBar Widget', widget: const Placeholder()),
        ],
      ),
    );
  }
}
