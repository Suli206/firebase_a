import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseCrud {
  late CollectionReference notes;

  collectionRef() async {
    final pref = await SharedPreferences.getInstance();
    final email = pref.getString('email');
    if (email != null) {
      notes = FirebaseFirestore.instance.collection(email);
    } else {
      print('ne poluchilos sozdat collection');
    }
  }

// Add
  addNote(String name, String description) async {
    await collectionRef();
    return notes.add({
      "Name": name,
      "Description": description,
      "time": Timestamp.now(),
    });
  }

// Read
  Stream<QuerySnapshot> readNotes() async* {
    await collectionRef();
    yield* notes.orderBy("time", descending: true).snapshots();
  }

// UpDate
  updateNotes(String newName, String newDescription, String docId) async {
    await collectionRef();
    return notes.doc(docId).update({
      "Name": newName,
      "Description": newDescription,
    });
  }

// Delete
  deleteNotes(String docId) async {
    await collectionRef();
    return notes.doc(docId).delete();
  }
}
