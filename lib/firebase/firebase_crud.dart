import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCrud {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('Notes');

// Add
  addNote(String name, String description) {
    return notes.add({
      "Name": name,
      "Description": description,
      "time": Timestamp.now(),
    });
  }

// Read
  Stream<QuerySnapshot> readNotes() {
    return notes.orderBy("time", descending: true).snapshots();
  }

// UpDate
  updateNotes(String newName, String newDescription, String docId) {
    return notes.doc(docId).update({
      "Name": newName,
      "Description": newDescription,
    });
  }

// Delete
  deleteNotes(String docId) {
    return notes.doc(docId).delete();
  }
}
