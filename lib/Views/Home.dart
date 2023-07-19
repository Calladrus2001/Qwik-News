import 'package:comet_labs_task/Utils/colors.dart';
import 'package:comet_labs_task/Views/CommunityView.dart';
import 'package:comet_labs_task/Views/NewsView.dart';
import 'package:comet_labs_task/Views/ProfileView.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    List<Widget> bodyPages = [const ProfileScreen(), const NewsScreen(), const CommunityScreen()];
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: index,
          selectedItemColor: primaryAccent,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),
                label: "Your Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.speaker_notes_outlined), label: "News"),
            BottomNavigationBarItem(
                icon: Icon(Icons.group), label: "Community"),
          ],
          onTap: (int _index) {
            setState(() {
              index = _index;
            });
          },
        ),
        body: Stack(
          children: [
            IndexedStack(
              index: index,
              children: bodyPages,
            ),
          ],
        ));
  }
}
