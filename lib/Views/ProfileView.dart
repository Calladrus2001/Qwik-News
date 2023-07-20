import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: GestureDetector(
            child: const Chip(label: Text("Sign Out", style: TextStyle(color: Colors.redAccent)),
              backgroundColor: Colors.white,
              elevation: 5.0,
            ),
            onTap: (){
              FirebaseAuth.instance.signOut();
              GoogleSignIn().signOut();
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }
}
