import 'package:firebase_a/features/auth/Sing%20Up/sing_up.dart';
import 'package:firebase_a/features/home/notes_home.dart';
import 'package:firebase_a/widget/app_unfocuser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final pref = await SharedPreferences.getInstance();
  final isRegi = pref.getBool('user') ?? false;
  runApp(Main(isRegistered: isRegi));
}

class Main extends StatelessWidget {
  const Main({super.key, required this.isRegistered});
  final bool isRegistered;

  @override
  Widget build(BuildContext context) {
    return AppUnfocuser(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isRegistered ? const NotesHome() : const SingUpSreen(),
      ),
    );
  }
}
