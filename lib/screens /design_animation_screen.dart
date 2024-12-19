import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class DesignAnimationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {'title': 'Customizing Fonts', 'route': const CustomizingFontsScreen()},
    {'title': 'Skeleton Text', 'route': const SkeletonTextScreen()},
    {'title': 'Route Transition Animation', 'route':const  RouteTransitionAnimationScreen()},
    {'title': 'Ripple Effect', 'route': const RippleEffectScreen()},
    {'title': 'UI Orientation', 'route':const  UIOrientationScreen()},
    {'title': 'Physics Simulation', 'route': const PhysicsSimulationScreen()},
    {'title': 'Radial Hero Animation', 'route': const RadialHeroAnimationScreen()},
    {'title': 'PhotoHero Class', 'route':const  PhotoHeroClassScreen()},
    {'title': 'Hinge Animation', 'route':const  HingeAnimationScreen()},
    {'title': 'Lottie Animation', 'route':const  LottieAnimationScreen()},
    {'title': 'Using Google Fonts', 'route':const  UsingGoogleFontsScreen()},
    {'title': 'Auto Size Text', 'route': const AutoSizeTextScreen()},
    {'title': 'Rotate Transition', 'route':const  RotateTransitionScreen()},
    {'title': 'Lazy Loader', 'route': const LazyLoaderScreen()},
    {'title': 'Animated Splash Screen', 'route':const  AnimatedSplashScreen()},
    {'title': 'Shimmer', 'route': const ShimmerScreen()},
    {'title': 'Rive Animations', 'route': const RiveAnimationsScreen()},
    {'title': 'Progress Indicator', 'route':const ProgressIndicatorScreen()},
  ];

  DesignAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Design & Animation',
          style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: features.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => features[index]['route']),
                );
              },
              child: Text(
                features[index]['title'],
                style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomizingFontsScreen extends StatelessWidget {
  const CustomizingFontsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customizing Fonts')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Default Font',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              'Using Google Fonts - Roboto',
              style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Using Google Fonts - Lato',
              style: GoogleFonts.lato(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 10),
            Text(
              'Using Custom Font',
              style: TextStyle(
                fontFamily: 'CustomFont',
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                textStyle: GoogleFonts.montserrat(fontSize: 18),
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
              child: Text('Button with Custom Font'),
            ),
          ],
        ),
      ),
    );
  }
}

class SkeletonTextScreen extends StatefulWidget {
  const SkeletonTextScreen({super.key});

  @override
  State<SkeletonTextScreen> createState() => _SkeletonTextScreenState();
}

class _SkeletonTextScreenState extends State<SkeletonTextScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate a data loading delay
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skeleton Text')),
      body: Center(
        child: isLoading
            ? Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 20.0,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
              )
            : const Text(
                'Content loaded successfully!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
class RouteTransitionAnimationScreen extends StatelessWidget {
  const RouteTransitionAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Route Transition Animation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(_fadeRoute(const ScreenOne()));
              },
              child: const Text('Fade Transition to Screen 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(_slideRoute(const ScreenTwo()));
              },
              child: const Text('Slide Transition to Screen 2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(_scaleRoute(const ScreenThree()));
              },
              child: const Text('Scale Transition to Screen 3'),
            ),
          ],
        ),
      ),
    );
  }

  // Fade Transition
  PageRouteBuilder _fadeRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  // Slide Transition
  PageRouteBuilder _slideRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  // Scale Transition
  PageRouteBuilder _scaleRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOut;
        var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
        var scaleAnimation = animation.drive(tween);

        return ScaleTransition(scale: scaleAnimation, child: child);
      },
    );
  }
}

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 1')),
      body: const Center(child: Text('Welcome to Screen 1')),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 2')),
      body: const Center(child: Text('Welcome to Screen 2')),
    );
  }
}

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 3')),
      body: const Center(child: Text('Welcome to Screen 3')),
    );
  }
}

class RippleEffectScreen extends StatelessWidget {
  const RippleEffectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const  Text('Ripple Effect')),
      body: const Center(child: Text('Ripple Effect Content')),
    );
  }
}

class UIOrientationScreen extends StatelessWidget {
  const UIOrientationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Orientation')),
      body: const Center(child: Text('UI Orientation Content')),
    );
  }
}

class PhysicsSimulationScreen extends StatelessWidget {
  const PhysicsSimulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Physics Simulation')),
      body: const Center(child: Text('Physics Simulation Content')),
    );
  }
}

class ThemesScreen extends StatelessWidget {
  const ThemesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Themes')),
      body: const Center(child: Text('Themes Content')),
    );
  }
}

class RadialHeroAnimationScreen extends StatelessWidget {
  const RadialHeroAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Radial Hero Animation')),
      body: const Center(child: Text('Radial Hero Animation Content')),
    );
  }
}

class PhotoHeroClassScreen extends StatelessWidget {
  const PhotoHeroClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PhotoHero Class')),
      body: const Center(child: Text('PhotoHero Class Content')),
    );
  }
}

class HingeAnimationScreen extends StatelessWidget {
  const HingeAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hinge Animation')),
      body: const Center(child: Text('Hinge Animation Content')),
    );
  }
}

class LottieAnimationScreen extends StatelessWidget {
  const LottieAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lottie Animation')),
      body: const Center(child: Text('Lottie Animation Content')),
    );
  }
}

class UsingGoogleFontsScreen extends StatelessWidget {
  const UsingGoogleFontsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Using Google Fonts')),
      body: const Center(child: Text('Using Google Fonts Content')),
    );
  }
}

class AutoSizeTextScreen extends StatelessWidget {
  const AutoSizeTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auto Size Text')),
      body: const Center(child: Text('Auto Size Text Content')),
    );
  }
}

class RotateTransitionScreen extends StatelessWidget {
  const RotateTransitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rotate Transition')),
      body: const Center(child: Text('Rotate Transition Content')),
    );
  }
}

class LazyLoaderScreen extends StatelessWidget {
  const LazyLoaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lazy Loader')),
      body: const Center(child: Text('Lazy Loader Content')),
    );
  }
}

class AnimatedSplashScreen extends StatelessWidget {
  const AnimatedSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Splash Screen')),
      body: const Center(child: Text('Animated Splash Screen Content')),
    );
  }
}

class ShimmerScreen extends StatelessWidget {
  const ShimmerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shimmer')),
      body: const Center(child: Text('Shimmer Content')),
    );
  }
}

class RiveAnimationsScreen extends StatelessWidget {
  const RiveAnimationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rive Animations')),
      body: const Center(child: Text('Rive Animations Content')),
    );
  }
}

class ProgressIndicatorScreen extends StatelessWidget {
  const ProgressIndicatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicator')),
      body: const Center(child: Text('Progress Indicator Content')),
    );
  }
}
