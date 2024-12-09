import 'package:firebase_a/features/auth/Sing%20Up/sing_up.dart';
import 'package:firebase_a/features/navigator_sreen/navi_screen.dart';
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
        theme: ThemeData.light().copyWith(
          splashFactory: NoSplash.splashFactory, // bol onTap
          highlightColor: Colors.transparent, // mali onTap
        ),
        debugShowCheckedModeBanner: false,
        home: isRegistered ? const NaviScreen() : const SingUpSreen(),
      ),
    );
  }
}
