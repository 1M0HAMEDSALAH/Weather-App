import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  List<double> _circleSizes = [
    50.0,
    50.0,
    50.0,
    50.0
  ]; // Initial sizes for each pin
  List<Color> _pinColors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.purple
  ]; // Pin colors
  late List<int> _delays;

  @override
  void initState() {
    super.initState();
    _delays = [0, 200, 400, 600]; // Staggered delays for the wave effect
    _animateWave();
  }

  // Sequential animation logic to create a wave effect
  void _animateWave() {
    for (int i = 0; i < 4; i++) {
      Future.delayed(Duration(milliseconds: _delays[i]), () {
        setState(() {
          // Alternate the size between 50.0 and 40.0 for wave effect
          _circleSizes[i] = _circleSizes[i] == 30.0 ? 20.0 : 30.0;
        });
        // After one cycle, restart the wave effect to continue
        if (i == 3) {
          _animateWave();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(4, (index) {
            // Create animated pins with a smooth wave-like motion
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedContainer(
                duration: const Duration(
                    milliseconds:
                        100), // Longer duration for smoother animation
                curve: Curves
                    .easeInOut, // Smooth transition for wave-like movement
                width: _circleSizes[index],
                height: _circleSizes[index],
                decoration: BoxDecoration(
                  color: _pinColors[index], // Different color for each pin
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
