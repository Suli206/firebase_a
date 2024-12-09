import 'package:firebase_a/features/chat/chat.dart';
import 'package:firebase_a/features/news/news.dart';
import 'package:firebase_a/features/notes/notes_home.dart';
import 'package:firebase_a/features/settings/settings.dart';
import 'package:flutter/material.dart';

class NaviScreen extends StatefulWidget {
  const NaviScreen({super.key});

  @override
  State<NaviScreen> createState() => _NaviScreenState();
}

class _NaviScreenState extends State<NaviScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        backgroundColor: const Color.fromARGB(226, 3, 7, 120),
        onTap: (indexScreen) {
          index = indexScreen;
          setState(() {});
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              size: 26,
              Icons.note_add_sharp,
              color: index == 0 ? Colors.white : Colors.white.withOpacity(0.5),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              size: 26,
              Icons.chat,
              color: index == 1 ? Colors.white : Colors.white.withOpacity(0.5),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              size: 26,
              Icons.newspaper,
              color: index == 2 ? Colors.white : Colors.white.withOpacity(0.5),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              size: 26,
              Icons.settings,
              color: index == 3 ? Colors.white : Colors.white.withOpacity(0.5),
            ),
            label: '',
          ),
        ],
      ),
      body: sreensList[index],
    );
  }
}

List sreensList = [
  const NotesHome(),
  const Chat(),
  const News(),
  const Settings(),
];
