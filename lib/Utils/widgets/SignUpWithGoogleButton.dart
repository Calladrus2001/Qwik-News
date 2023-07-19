import 'package:comet_labs_task/Utils/functions/SignInWithGoogle.dart';
import 'package:comet_labs_task/Views/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpWithGoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: ElevatedButton(
        onPressed: () async {
          User? currentUser = await signUpWithGoogle();
          if (currentUser != null) {
            Get.to(()=>const HomeView());
          }
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
              'assets/images/google_logo.png',
              height: 24.0,
              width: 24.0,
            ),
            const SizedBox(width: 10.0),
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
