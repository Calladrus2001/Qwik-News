import 'package:comet_labs_task/Utils/widgets/LogInWithAccountButton.dart';
import 'package:comet_labs_task/Utils/widgets/SignUpWithGoogleButton.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightGreen.shade900, // Light green
              Colors.green.shade900,      // Forest green
              Colors.black,               // Black
            ],
            stops: const [0.1, 0.2, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SignUpWithGoogleButton(),
              const SizedBox(height: 10.0), // Add spacing between the buttons
              LogInWithMyAccountButton(),
            ],
          ),
        ),
      ),
    );
  }
}
