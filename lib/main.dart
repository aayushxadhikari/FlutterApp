import 'package:flutter/material.dart';
import 'package:flutterproject/screens%20/ui_components.dart';
import 'screens /accessing_device_screen.dart';
import 'screens /advanced_flutter_concepts_screen.dart';
import 'screens /design_animation_screen.dart';
import 'screens /forms_gestures_screen.dart';
import 'screens /main_screen.dart';
import 'screens /splash_screen.dart';
import 'screens /widgets_screen.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/main': (context) =>const MainScreen(),
        '/widgets': (context) => const WidgetsScreen(),
        '/ui_components': (context) => const Uicomponents() ,
        '/design_animation': (context) => const DesignAnimationScreen(),
        '/forms_gestures': (context) => const FormsGesturesScreen(),
        '/accessing_device': (context) => const AccessingDeviceScreen(),
        '/advanced_flutter': (context) => const AdvancedFlutterConceptsScreen(),
      },
    );
  }
}
