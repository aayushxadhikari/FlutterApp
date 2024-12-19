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
        child: SingleChildScrollView(
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
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_rotationRoute(const ScreenFour()));
                },
                child: const Text('Rotation Transition to Screen 4'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_sizeRoute(const ScreenFive()));
                },
                child: const Text('Size Transition to Screen 5'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_customCurveRoute(const ScreenSix()));
                },
                child: const Text('Custom Curve Transition to Screen 6'),
              ),
            ],
          ),
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

  // Rotation Transition
  PageRouteBuilder _rotationRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return RotationTransition(turns: animation, child: child);
      },
    );
  }

  // Size Transition
  PageRouteBuilder _sizeRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return Align(
          child: SizeTransition(sizeFactor: animation, child: child),
        );
      },
    );
  }

  // Custom Curve Transition
  PageRouteBuilder _customCurveRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.bounceInOut;
        var curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

        return SlideTransition(
          position: Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}

// Dummy Screens for Navigation
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

class ScreenFour extends StatelessWidget {
  const ScreenFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 4')),
      body: const Center(child: Text('Welcome to Screen 4')),
    );
  }
}

class ScreenFive extends StatelessWidget {
  const ScreenFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 5')),
      body: const Center(child: Text('Welcome to Screen 5')),
    );
  }
}

class ScreenSix extends StatelessWidget {
  const ScreenSix({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 6')),
      body: const Center(child: Text('Welcome to Screen 6')),
    );
  }
}


class RippleEffectScreen extends StatelessWidget {
  const RippleEffectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ripple Effect')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Center(
            child: Text(
              'Ripple Effect Examples',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),

          // 1. Standard Material Ripple Effect
          ListTile(
            title: const Text('Standard Material Ripple'),
            tileColor: Colors.blue[100],
            onTap: () {},
          ),

          const SizedBox(height: 10),

          // 2. Button with Ripple Effect
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            ),
            child: const Text('Button Ripple Effect'),
          ),

          const SizedBox(height: 10),

          // 3. IconButton with Ripple
          Center(
            child: IconButton(
              icon: const Icon(Icons.favorite, color: Colors.red),
              iconSize: 50,
              onPressed: () {},
            ),
          ),

          const SizedBox(height: 10),

          // 4. Custom Ripple with GestureDetector
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Custom Ripple Triggered!')),
              );
            },
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(8.0),
                splashColor: Colors.greenAccent,
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Custom Ripple with GestureDetector',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // 5. Ripple in a Circle
          Center(
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              splashColor: Colors.blue,
              onTap: () {},
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  'Circle Ripple',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // 6. Image with Ripple Effect
          GestureDetector(
            onTap: () {},
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://via.placeholder.com/300',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.white.withOpacity(0.5),
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // 7. List with Ripple Effect
          for (int i = 0; i < 5; i++)
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text('${i + 1}'),
              ),
              title: Text('List Item ${i + 1}'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tapped on List Item ${i + 1}')),
                );
              },
            ),

          const SizedBox(height: 10),

          // 8. GridView with Ripple Effect
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tapped on Grid Item ${index + 1}')),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.purple[100],
                  child: Text(
                    'Grid Item ${index + 1}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
        ],
      ),
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
