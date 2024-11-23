import 'package:firebase_a/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class NotesHome extends StatelessWidget {
  const NotesHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(226, 3, 7, 120),
        title: Text(
          'Notes',
          style: AppTextStyles.s22W400(),
        ),
      ),
      body: Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}

