import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  final List<String> letters = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.blue,
        elevation: 5.0,
      ),
      body: SizedBox(
        height: 400,
        child: CarouselSlider.builder(
            slideBuilder: (index) {
              return Container(
                alignment: Alignment.center,
                color: colors[index],
                child: Text(
                  letters[index],
                  style: TextStyle(fontSize: 200, color: Colors.white),
                ),
              );
            },
            slideTransform: const CubeTransform(),
            slideIndicator: CircularSlideIndicator(
              padding: const EdgeInsets.only(bottom: 32),
            ),
            itemCount: colors.length),
      ),
    );
  }
}
