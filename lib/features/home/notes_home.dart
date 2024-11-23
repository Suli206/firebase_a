import 'package:firebase_a/features/home/alert_dialog/add_dialg.dart';
import 'package:firebase_a/theme/app_text_styles.dart';
import 'package:firebase_a/widget/notes_wid.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              addTeFiDial(context);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 32,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding:
            const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 30),
        itemCount: 2,
        itemBuilder: (context, index) => NotesWid(
          text1: 'asf',
          text2: 'asdfasdf',
          onDelete: () {},
          onChange: () {},
        ),
      ),
    );
  }
}
