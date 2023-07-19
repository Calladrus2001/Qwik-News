import 'package:flutter/material.dart';

class SignUpWithGoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12.0), // Adjust horizontal margins as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0), // Set the border radius
      ),
      child: ElevatedButton(
        onPressed: () {
          // Implement your Google Sign Up logic here
          // For example, you can use Firebase Authentication with Google Sign-In
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/google_logo.png', // Replace with the Google logo asset path
              height: 24.0,
              width: 24.0,
            ),
            const SizedBox(width: 10.0), // Add some space between the logo and the text
            const Text(
              'Sign Up with Google',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
