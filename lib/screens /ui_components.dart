import 'dart:async';
import 'dart:math';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; 
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Uicomponents extends StatelessWidget {
  const Uicomponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Components Example"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildStyledButton(
            context,
            label: "Carousel Slider",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CarouselSliderExample()),
            ),
          ),
          _buildStyledButton(
            context,
            label: "Staggered Grid View",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StaggeredGridViewExample()),
            ),
          ),
          _buildStyledButton(
            context,
            label: "Progress Indicators",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ProgressIndicatorExample()),
            ),
          ),
          _buildStyledButton(
            context,
            label: "Dialogs",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DialogsExample()),
            ),
          ),
          _buildStyledButton(
            context,
            label: "Icons",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const IconExample()),
            ),
          ),
          _buildStyledButton(
            context,
            label: "Expanded Example",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ExpandedExample()),
            ),
          ),
          _buildStyledButton(
            context,
            label: "Analog Clock",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AnalogClockExample()),
            ),
          ),
          _buildStyledButton(
            context,
            label: "Expansion Tile Card",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ExpansionTileExample()),
            ),
          ),
          _buildStyledButton(
            context,
            label: "Tabs",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TabsExample()),
            ),
          ),
          _buildStyledButton(
            context,
            label: "Horizontal List",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HorizontalListExample()),
            ),
          ),
          _buildStyledButton(
            context,
            label: "Charts",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChartExample()),
            ),
          ),
          _buildStyledButton(
            context,
            label: "Convex Bottom Bar",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ConvexBottomBarExample()),
            ),
          ),
          _buildStyledButton(
            context,
            label: "Slidable Example",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SlidableExample()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStyledButton(BuildContext context,
      {required String label, required VoidCallback onPressed}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 5,
          textStyle:
              const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        child: Text(label),
      ),
    );
  }
}

class SlidableExample extends StatelessWidget {
  const SlidableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slidable Example')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Slidable(
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    // Define action for this slide (e.g., Delete)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Delete $index')),
                    );
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    // Define another action for this slide (e.g., Edit)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Edit $index')),
                    );
                  },
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
              ],
            ),
            child: ListTile(
              leading: const Icon(Icons.list),
              title: Text('Item $index'),
              subtitle: const Text('Swipe to see actions'),
            ),
          );
        },
      ),
    );
  }
}

class ConvexBottomBarExample extends StatefulWidget {
  const ConvexBottomBarExample({super.key});

  @override
  _ConvexBottomBarExampleState createState() => _ConvexBottomBarExampleState();
}

class _ConvexBottomBarExampleState extends State<ConvexBottomBarExample> {
  int _selectedIndex = 0;

  // List of screens for each tab
  final List<Widget> _screens = [
    const Center(child: Text('Home Screen')),
    const Center(child: Text('Search Screen')),
    const Center(child: Text('Notifications Screen')),
    const Center(child: Text('Profile Screen')),
  ];

  // Method to change the selected tab
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Convex Bottom Bar Example')),
      body: _screens[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.search, title: 'Search'),
          TabItem(icon: Icons.notifications, title: 'Notifications'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        onTap: _onItemTapped,
        backgroundColor: Colors.blue,
        height: 60.0,
      ),
    );
  }
}

class HorizontalListExample extends StatelessWidget {
  const HorizontalListExample({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];
    return Scaffold(
      appBar: AppBar(title: const Text("Enhanced Horizontal List Example")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                onTap: () {
                  // Show a snackbar when an item is tapped
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tapped on ${items[index]}')),
                  );
                },
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.primaries[index % Colors.primaries.length],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      items[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ChartExample extends StatelessWidget {
  const ChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chart Example")),
      body: SfCartesianChart(
        primaryXAxis: const CategoryAxis(),
        series: <CartesianSeries>[
          ColumnSeries<Map<String, String>, String>(
            dataSource: const [
              {'x': 'Jan', 'y': '35'},
              {'x': 'Feb', 'y': '28'}
            ],
            xValueMapper: (Map<String, String> data, _) => data['x'],
            yValueMapper: (Map<String, String> data, _) =>
                int.parse(data['y']!),
            name: 'Sales',
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

// Individual UI components start here

class CarouselSliderExample extends StatelessWidget {
  const CarouselSliderExample({super.key});

  @override
  Widget build(BuildContext context) {
    // List of colors for each page
    final List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.purple,
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Carousel Slider")),
      body: CarouselSlider(
        options: CarouselOptions(
          height: 400.0,
          enlargeCenterPage: true, // Make the centered page bigger
          viewportFraction: 0.8,  // Adjust this to add space between the items
        ),
        items: [1, 2, 3, 4].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0), // Add margin between items
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0), // Rounded corners
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: colors[i - 1], // Assign color based on the item index
                    child: Center(
                      child: Text(
                        'Item $i',
                        style: const TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}


class Tile extends StatelessWidget {
  final int index;
  const Tile({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[100 * (index % 9)],
      child: Center(
        child: Text(
          "Item $index",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class StaggeredGridViewExample extends StatelessWidget {
  const StaggeredGridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Staggered Grid Example")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGrid.count(
          crossAxisCount: 4,  // Number of columns
          mainAxisSpacing: 4, // Vertical spacing between tiles
          crossAxisSpacing: 4, // Horizontal spacing between tiles
          children: const [
            StaggeredGridTile.count(
              crossAxisCellCount: 2, // Width of the tile (2 columns wide)
              mainAxisCellCount: 2, // Height of the tile (2 rows tall)
              child: Tile(index: 0),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2, // Width of the tile (2 columns wide)
              mainAxisCellCount: 1, // Height of the tile (1 row tall)
              child: Tile(index: 1),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1, // Width of the tile (1 column wide)
              mainAxisCellCount: 1, // Height of the tile (1 row tall)
              child: Tile(index: 2),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1, // Width of the tile (1 column wide)
              mainAxisCellCount: 1, // Height of the tile (1 row tall)
              child: Tile(index: 3),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4, // Width of the tile (4 columns wide)
              mainAxisCellCount: 2, // Height of the tile (2 rows tall)
              child: Tile(index: 4),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressIndicatorExample extends StatelessWidget {
  const ProgressIndicatorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Progress Indicators")),
      body: Center(
        child: SingleChildScrollView(  // To allow scrolling if the content overflows
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Basic Circular Progress Indicator
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              
              // Circular Progress Indicator with custom color and size
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                strokeWidth: 6,
              ),
              const SizedBox(height: 20),
              
              // Linear Progress Indicator
              const LinearProgressIndicator(),
              const SizedBox(height: 20),
              
              // Linear Progress Indicator with custom color
              const LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                minHeight: 8,
              ),
              const SizedBox(height: 20),
              
              // Determinate Circular Progress Indicator
              const CircularProgressIndicator(
                value: 0.7,  // Determines the progress (0.0 to 1.0)
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                strokeWidth: 8,
              ),
              const SizedBox(height: 20),
              
              // Custom Animated Circular Progress Indicator (using `TweenAnimationBuilder`)
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 3),
                builder: (context, double value, child) {
                  return CircularProgressIndicator(value: value);
                },
              ),
              const SizedBox(height: 20),
              
              // Custom Progress Bar with BoxDecoration (Linear)
              Container(
                height: 10,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                ),
                child: Stack(
                  children: [
                    Container(
                      width: 140, // Determines progress (value between 0 and 200)
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DialogsExample extends StatelessWidget {
  const DialogsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dialogs Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Button to show AlertDialog
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text("AlertDialog Example"),
                    content: const Text("This is an example of an alert dialog."),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Close"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Show AlertDialog"),
            ),
            const SizedBox(height: 20),

            // Button to show Simple Dialog
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => SimpleDialog(
                    title: const Text("Simple Dialog Example"),
                    children: <Widget>[
                      SimpleDialogOption(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Option 1"),
                      ),
                      SimpleDialogOption(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Option 2"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Show Simple Dialog"),
            ),
            const SizedBox(height: 20),

            // Button to show Confirmation Dialog
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text("Are you sure?"),
                    content: const Text("Do you want to perform this action?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle confirmation action
                          Navigator.of(context).pop();
                        },
                        child: const Text("Confirm"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Show Confirmation Dialog"),
            ),
            const SizedBox(height: 20),

            // Button to show Custom Dialog
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 5,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Custom Dialog",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text("This is a custom dialog with rounded corners."),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: const Text("Show Custom Dialog"),
            ),
            const SizedBox(height: 20),

            // Button to show Loading Dialog
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false, // Prevent closing when tapping outside
                  builder: (BuildContext context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                // Simulate a network call or long-running task
                Future.delayed(const Duration(seconds: 3), () {
                  Navigator.of(context).pop(); // Close the dialog after 3 seconds
                });
              },
              child: const Text("Show Loading Dialog"),
            ),
          ],
        ),
      ),
    );
  }
}

class IconExample extends StatelessWidget {
  const IconExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Icons Example")),
      body: const Padding(
        padding:  EdgeInsets.all(16.0),
        child: SingleChildScrollView( // To enable scrolling if content overflows
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              // Default Material Icon (Home)
               Icon(
                Icons.home,
                size: 50,
                color: Colors.blue,
              ),
               SizedBox(height: 20),

              // FontAwesome Home Icon
               Icon(
                FontAwesomeIcons.home,
                size: 50,
                color: Colors.green,
              ),
               SizedBox(height: 20),

              // Material Icon (Search)
               Icon(
                Icons.search,
                size: 50,
                color: Colors.orange,
              ),
               SizedBox(height: 20),

              // FontAwesome Search Icon
               Icon(
                FontAwesomeIcons.search,
                size: 50,
                color: Colors.purple,
              ),
               SizedBox(height: 20),

              // Material Icon (Settings)
               Icon(
                Icons.settings,
                size: 50,
                color: Colors.red,
              ),
               SizedBox(height: 20),

              // FontAwesome Settings Icon
               Icon(
                FontAwesomeIcons.cogs,
                size: 50,
                color: Colors.pink,
              ),
               SizedBox(height: 20),

              // Material Icon (Favorite)
               Icon(
                Icons.favorite,
                size: 50,
                color: Colors.pink,
              ),
               SizedBox(height: 20),

              // FontAwesome Heart Icon (as an alternative to Material 'favorite')
               Icon(
                FontAwesomeIcons.heart,
                size: 50,
                color: Colors.red,
              ),
               SizedBox(height: 20),

              // Material Icon (Camera)
               Icon(
                Icons.camera_alt,
                size: 50,
                color: Colors.teal,
              ),
               SizedBox(height: 20),

              // FontAwesome Camera Icon
               Icon(
                FontAwesomeIcons.camera,
                size: 50,
                color: Colors.blueGrey,
              ),
               SizedBox(height: 20),

              // Material Icon (Notifications)
               Icon(
                Icons.notifications,
                size: 50,
                color: Colors.indigo,
              ),
               SizedBox(height: 20),

              // FontAwesome Bell Icon (alternative to Notifications)
               Icon(
                FontAwesomeIcons.bell,
                size: 50,
                color: Colors.amber,
              ),
               SizedBox(height: 20),

              // Material Icon (Email)
               Icon(
                Icons.email,
                size: 50,
                color: Colors.deepPurple,
              ),
               SizedBox(height: 20),

              // FontAwesome Envelope Icon (alternative to Email)
               Icon(
                FontAwesomeIcons.envelope,
                size: 50,
                color: Colors.lightBlue,
              ),
               SizedBox(height: 20),

              // Material Icon (Person)
               Icon(
                Icons.person,
                size: 50,
                color: Colors.teal,
              ),
               SizedBox(height: 20),

              // FontAwesome User Icon (alternative to Person)
               Icon(
                FontAwesomeIcons.user,
                size: 50,
                color: Colors.deepOrange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandedExample extends StatelessWidget {
  const ExpandedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expanded Widget Example")),
      body: Row(
        children: [
          Expanded(child: Container(color: Colors.red, height: 100)),
          Expanded(child: Container(color: Colors.green, height: 100)),
          Expanded(child: Container(color: Colors.blue, height: 100)),
        ],
      ),
    );
  }
}

class AnalogClockExample extends StatefulWidget {
  const AnalogClockExample({super.key});

  @override
  _AnalogClockExampleState createState() => _AnalogClockExampleState();
}

class _AnalogClockExampleState extends State<AnalogClockExample> {
  late Timer _timer;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Analog Clock Example")),
      body: Center(
        child: CustomPaint(
          size: const Size(300, 300),
          painter: ClockPainter(currentTime: _currentTime),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final DateTime currentTime;

  ClockPainter({required this.currentTime});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final Paint fillPaint = Paint()
      ..color = Colors.blueGrey
      ..style = PaintingStyle.fill;

    final Paint hourHandPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    final Paint minuteHandPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final Paint secondHandPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw the clock face circle
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, paint);

    // Draw the clock center
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 5, fillPaint);

    // Get the angles for the hands
    final double hourAngle = (2 * pi) * (currentTime.hour % 12 + currentTime.minute / 60) / 12;
    final double minuteAngle = (2 * pi) * currentTime.minute / 60;
    final double secondAngle = (2 * pi) * currentTime.second / 60;

    // Draw hour hand
    final double hourHandLength = size.width / 4;
    canvas.drawLine(
      Offset(size.width / 2, size.height / 2),
      Offset(size.width / 2 + hourHandLength * cos(hourAngle - pi / 2),
             size.height / 2 + hourHandLength * sin(hourAngle - pi / 2)),
      hourHandPaint,
    );

    // Draw minute hand
    final double minuteHandLength = size.width / 3;
    canvas.drawLine(
      Offset(size.width / 2, size.height / 2),
      Offset(size.width / 2 + minuteHandLength * cos(minuteAngle - pi / 2),
             size.height / 2 + minuteHandLength * sin(minuteAngle - pi / 2)),
      minuteHandPaint,
    );

    // Draw second hand
    final double secondHandLength = size.width / 2.5;
    canvas.drawLine(
      Offset(size.width / 2, size.height / 2),
      Offset(size.width / 2 + secondHandLength * cos(secondAngle - pi / 2),
             size.height / 2 + secondHandLength * sin(secondAngle - pi / 2)),
      secondHandPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ExpansionTileExample extends StatelessWidget {
  const ExpansionTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expansion Tile Example")),
      body: ListView(
        children: const [
          // First ExpansionTile with custom content
           ExpansionTile(
            title: Text("Expansion Tile 1"),
            subtitle: Text("Tap to expand"),
            leading: Icon(Icons.info),
            children: [Text("This is the content for the first tile.")],
          ),

          // Second ExpansionTile with different content
           ExpansionTile(
            title: Text("Expansion Tile 2"),
            leading: Icon(Icons.settings),
            children: [
              Text("Tile 2 Content"),
              Text("More content here for the second tile."),
            ],
          ),

          // Third ExpansionTile with an icon and subtitle
           ExpansionTile(
            title: Text("Expansion Tile 3"),
            subtitle: Text("Tap to explore"),
            leading: Icon(Icons.access_alarm),
            children: [
              Text("This is the content for the third tile."),
              Text("Another piece of content inside tile 3."),
            ],
          ),

          // Nested ExpansionTile inside another
           ExpansionTile(
            title: Text("Expansion Tile 4"),
            leading: Icon(Icons.list),
            children: [
              Text("Main content of the fourth tile."),
              ExpansionTile(
                title: Text("Nested Expansion Tile 1"),
                leading: Icon(Icons.nature),
                children: [
                  Text("This is a nested tile inside the fourth tile."),
                ],
              ),
              ExpansionTile(
                title: Text("Nested Expansion Tile 2"),
                leading: Icon(Icons.nature_people),
                children: [
                  Text("Another nested tile inside the fourth tile."),
                ],
              ),
            ],
          ),

          // ExpansionTile with a different style
           ExpansionTile(
            title: Text("Expansion Tile 5"),
            subtitle: Text("Customize your view"),
            leading: Icon(Icons.build),
            children: [
              Text("Tile content can be customized."),
              Text("This tile has some additional information."),
            ],
          ),
        ],
      ),
    );
  }
}

class TabsExample extends StatelessWidget {
  const TabsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.music_note),
                ),
                Tab(
                  icon: Icon(Icons.music_video),
                ),
                Tab(
                  icon: Icon(Icons.camera_alt),
                ),
                Tab(
                  icon: Icon(Icons.grade),
                ),
                Tab(
                  icon: Icon(Icons.email),
                ),
              ],
            ),
            title: const Text('Tabs Example'),
            backgroundColor: Colors.white,
          ),
          body: const TabBarView(
            children: [
              Tab(
                icon: Icon(Icons.music_note),
              ),
              Tab(
                icon: Icon(Icons.music_video),
              ),
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                icon: Icon(Icons.grade),
              ),
              Tab(
                icon: Icon(Icons.email),
              ),
            ],
          ),
        ));
  }
}
