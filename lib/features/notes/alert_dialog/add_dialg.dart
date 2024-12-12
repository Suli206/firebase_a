import 'package:firebase_a/firebase/firebase_crud.dart';
import 'package:flutter/material.dart';

addTeFiDial(BuildContext contexT) async {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerDescription = TextEditingController();
  final FirebaseCrud fire = FirebaseCrud();

  showDialog(
    context: contexT,
    builder: (context) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 300,
            child: TextFormField(
              controller: controllerName,
              decoration: const InputDecoration(
                hintText: 'Enter your name',
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 300,
            child: TextFormField(
              controller: controllerDescription,
              decoration: const InputDecoration(
                hintText: 'Enter a description',
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            await fire.addNote(controllerName.text, controllerDescription.text);
            Navigator.of(context).pop();
          },
          child: const Text('Save'),
        ),
      ],
    ),
  );
}
