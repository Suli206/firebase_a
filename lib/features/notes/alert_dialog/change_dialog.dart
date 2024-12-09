import 'package:firebase_a/firebase/firebase_crud.dart';
import 'package:flutter/material.dart';

chaTeFiDial(
  BuildContext context,
  String docId,
  String contName,
  String contDes,
) {
  final TextEditingController controllerName =
      TextEditingController(text: contName);
  final TextEditingController controllerDescription =
      TextEditingController(text: contDes);
  final FirebaseCrud fire = FirebaseCrud();

  showDialog(
    context: context,
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
            await fire.updateNotes(
              controllerName.text.isNotEmpty ? controllerName.text : '',
              controllerDescription.text.isNotEmpty
                  ? controllerDescription.text
                  : '',
              docId,
            );
            Navigator.of(context).pop();
          },
          child: const Text('Save'),
        ),
      ],
    ),
  );
}
