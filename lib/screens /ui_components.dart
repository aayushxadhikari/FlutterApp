import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; // Add this dependency in pubspec.yaml

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
              MaterialPageRoute(builder: (context) => const GridViewExample()),
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
          backgroundColor: Colors.deepPurple,
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
      appBar: AppBar(title: const Text("Slidable Example")),
      body: const Center(child: Text('Slidable Widget Placeholder')),
    );
  }
}

class ConvexBottomBarExample extends StatelessWidget {
  const ConvexBottomBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Convex Bottom Bar Example")),
      body: const Center(child: Text('Convex Bottom Bar Placeholder')),
    );
  }
}

class HorizontalListExample extends StatelessWidget {
  const HorizontalListExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Horizontal List Example")),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(color: Colors.blue, width: 100),
          Container(color: Colors.red, width: 100)
        ],
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

class GridViewExample extends StatelessWidget {
  const GridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grid View Example")),
      body: GridView.count(
        crossAxisCount: 4,
        children: List.generate(8, (index) {
          return Container(
            color: Colors.teal[100 * (index % 9)],
            child: Center(child: Text("Item $index")),
          );
        }),
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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            LinearProgressIndicator(),
          ],
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
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text("Dialog Example"),
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
          child: const Text("Show Dialog"),
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
      body: const Center(
        child: Icon(
          FontAwesomeIcons.home,
          size: 50,
          color: Colors.blue,
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

class AnalogClockExample extends StatelessWidget {
  const AnalogClockExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Analog Clock Example")),
      body: const Center(
        child: Text("Analog Clock Placeholder"),
      ),
    );
  }
}

class ExpansionTileExample extends StatelessWidget {
  const ExpansionTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expansion Tile Example")),
      body: const ExpansionTile(
        title: Text("Expansion Tile"),
        children: [Text("Tile Content")],
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
