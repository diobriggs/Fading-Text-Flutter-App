import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FadingTextAnimation(),
    );
  }
}

class FadingTextAnimation extends StatefulWidget {
  const FadingTextAnimation({super.key});

  @override
  _FadingTextAnimationState createState() => _FadingTextAnimationState();
}

class _FadingTextAnimationState extends State<FadingTextAnimation> {
  bool _isVisible = true;
  bool _showFrame = false; // State to toggle frame visibility

  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void toggleFrame(bool value) {
    setState(() {
      _showFrame = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fading Text Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // Rounded corners
              child: Container(
                decoration: BoxDecoration(
                  border: _showFrame
                      ? Border.all(color: Colors.blueAccent, width: 3) // Frame
                      : null,
                ),
                child: GestureDetector(
                  onTap: toggleVisibility, // Toggle visibility on tap
                  child: AnimatedOpacity(
                    opacity: _isVisible ? 1.0 : 0.0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut, // Smoother animation
                    child: const Image(
                      image: AssetImage('assets/v813-aew-22.png'),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Switch to toggle frame visibility
            SwitchListTile(
              title: const Text('Show Frame'),
              value: _showFrame,
              onChanged: toggleFrame,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleVisibility,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
