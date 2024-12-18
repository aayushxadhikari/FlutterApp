import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';  // Make sure to add dependency in pubspec.yaml

class Uicomponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UI Components Example"),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CarouselSliderExample()));
            },
            child: Text("Flutter – Carousel Slider"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => GridViewExample()));
            },
            child: Text("Flutter – Staggered Grid View"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProgressIndicatorExample()));
            },
            child: Text("Flutter - Circular & Linear Progress Indicators"),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text("Alert Dialog"),
                  content: Text("This is an alert dialog box."),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close"),
                    ),
                  ],
                ),
              );
            },
            child: Text("Alert Dialog box in Flutter"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DialogsExample()));
            },
            child: Text("Flutter – Dialogs"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => IconExample()));
            },
            child: Text("Icon Class in Flutter"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ExpandedExample()));
            },
            child: Text("Expanded Class in Flutter"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AnalogClockExample()));
            },
            child: Text("Analog Clock in Flutter"),
          ),
          // Removed video player reference
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ExpansionTileExample()));
            },
            child: Text("Flutter – Expansion Tile Card"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TabsExample()));
            },
            child: Text("Flutter – Tabs"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HorizontalListExample()));
            },
            child: Text("Flutter – Horizontal List"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChartExample()));
            },
            child: Text("Flutter – Working with Charts"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ConvexBottomBarExample()));
            },
            child: Text("Flutter – Convex Bottombar"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SlidableExample()));
            },
            child: Text("Flutter – Slidable"),
          ),
        ],
      ),
    );
  }
}

// Sample UI components for each functionality

class CarouselSliderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carousel Slider")),
      body: CarouselSlider(
        options: CarouselOptions(height: 400.0),
        items: [1, 2, 3].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.amber,
                child: Center(child: Text('Item $i', style: TextStyle(fontSize: 16.0))),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}


class GridViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grid View Example")),
      body: GridView.count(
        crossAxisCount: 4,  // Number of columns
        children: List.generate(8, (index) {
          return Container(
            color: Colors.teal[100 * (index % 9)],  // Color each container differently
            child: Center(child: Text("Item $index")),
          );
        }),
      ),
    );
  }
}

class ProgressIndicatorExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Progress Indicators")),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          LinearProgressIndicator(),
        ],
      ),
    );
  }
}

class DialogsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dialogs Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => SimpleDialog(
                title: Text('Simple Dialog'),
                children: <Widget>[
                  Text('This is a simple dialog box'),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Close'),
                  ),
                ],
              ),
            );
          },
          child: Text('Show Dialog'),
        ),
      ),
    );
  }
}

class IconExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Icon Class Example")),
      body: const Center(
        child: Icon(
          FontAwesomeIcons.home,  // Using a FontAwesome icon here
          size: 50,
          color: Colors.blue,  // Set the color if needed
        ),
      ),
    );
  }
}

class ExpandedExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expanded Example")),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Analog Clock")),
      body: Center(child: Text('Analog Clock Placeholder')),
    );
  }
}

// Removed VideoExample class since video player was removed

class ExpansionTileExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expansion Tile")),
      body: ExpansionTile(
        title: Text("Tap to expand"),
        children: [Text("This is expanded content")],
      ),
    );
  }
}

class TabsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tabs Example")),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(tabs: [Tab(text: "Tab 1"), Tab(text: "Tab 2"), Tab(text: "Tab 3")]),
            Expanded(
              child: TabBarView(children: [
                Center(child: Text('Content 1')),
                Center(child: Text('Content 2')),
                Center(child: Text('Content 3')),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalListExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Horizontal List Example")),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [Container(color: Colors.blue, width: 100), Container(color: Colors.red, width: 100)],
      ),
    );
  }
}

class ChartExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chart Example")),
      body: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <CartesianSeries>[
          ColumnSeries<Map<String, String>, String>(
            dataSource: [
              {'x': 'Jan', 'y': '35'},
              {'x': 'Feb', 'y': '28'}
            ],
            xValueMapper: (Map<String, String> data, _) => data['x'],
            yValueMapper: (Map<String, String> data, _) => int.parse(data['y']!),
            name: 'Sales',
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class ConvexBottomBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Convex Bottom Bar Example")),
      body: Center(child: Text('Convex Bottom Bar Placeholder')),
    );
  }
}

class SlidableExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Slidable Example")),
      body: Center(child: Text('Slidable Widget Placeholder')),
    );
  }
}
