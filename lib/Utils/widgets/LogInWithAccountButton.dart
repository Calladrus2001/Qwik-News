import 'package:comet_labs_task/Views/Auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInWithMyAccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: Colors.green, width: 1.0),
        color: Colors.grey[800],
      ),
      child: ElevatedButton(
        onPressed: () {
          Get.to(()=>AuthScreen());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Make the ElevatedButton transparent
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: const Text(
          'Log In with my account',
          style: TextStyle(color: Colors.green),
        ),
      ),
    );
  }
}
