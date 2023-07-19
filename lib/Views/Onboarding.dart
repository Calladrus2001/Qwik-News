import 'package:comet_labs_task/Utils/widgets/LogInWithAccountButton.dart';
import 'package:comet_labs_task/Utils/widgets/SignUpWithGoogleButton.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Expanded(child: SizedBox(height: 1)),
              const Text("Qwik News", style: TextStyle(color: Colors.white, letterSpacing: -1, fontWeight: FontWeight.w700, fontSize: 28)),
              const Expanded(child: SizedBox(height: 1)),
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
