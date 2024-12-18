import 'package:flutter/material.dart';

class AccessingDeviceScreen extends StatelessWidget {
  const AccessingDeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessing Device Screen'),
      ),
      body: const Center(
        child: Text('Accessing Device content goes here'),
      ),
    );
  }
}
