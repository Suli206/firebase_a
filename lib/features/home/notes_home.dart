import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_a/features/home/alert_dialog/add_dialg.dart';
import 'package:firebase_a/features/home/alert_dialog/change_dialog.dart';
import 'package:firebase_a/firebase/firebase_crud.dart';
import 'package:firebase_a/theme/app_text_styles.dart';
import 'package:firebase_a/widget/notes_wid.dart';
import 'package:flutter/material.dart';

class NotesHome extends StatefulWidget {
  const NotesHome({super.key});

  @override
  State<NotesHome> createState() => _NotesHomeState();
}

class _NotesHomeState extends State<NotesHome> {
  final FirebaseCrud fire = FirebaseCrud();

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
      body: StreamBuilder<QuerySnapshot>(
        stream: fire.readNotes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;
            return ListView.builder(
                padding: const EdgeInsets.only(
                    top: 16, left: 16, right: 16, bottom: 30),
                itemCount: notesList.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = notesList[index];
                  String docId = document.id;
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  String name = data['Name'];
                  String description = data['Description'];
                  return NotesWid(
                    text1: name,
                    text2: description,
                    onDelete: () {
                      fire.deleteNotes(docId);
                    },
                    onChange: () {
                      chaTeFiDial(context, docId, name, description);
                    },
                  );
                });
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
