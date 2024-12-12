import 'package:firebase_a/features/auth/Sing%20Up/sing_up.dart';
import 'package:firebase_a/firebase/firebase_delete_account.dart';
import 'package:firebase_a/theme/app_text_styles.dart';
import 'package:firebase_a/widget/settings_wid.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(226, 3, 7, 120),
        title: Text(
          'Settings',
          style: AppTextStyles.s22W400(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            SettWid(
              text: 'Logout account',
              onTap: () async {
                final pref = await SharedPreferences.getInstance();
                await pref.remove('user');
                await pref.remove('email');
                await pref.remove('pass');
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SingUpSreen()),
                  (route) => false,
                );
              },
            ),
            SettWid(
              text: 'Delete account',
              onTap: () async {
                final pref = await SharedPreferences.getInstance();
                final password = pref.getString('pass');
                await deleAcc(password!);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SingUpSreen()),
                  (route) => false,
                );
                await pref.remove('user');
                await pref.remove('email');
                await pref.remove('pass');
              },
              icon: Icons.delete,
            ),
            SettWid(
              text: 'Language',
              onTap: () {},
              icon: Icons.language,
            ),
          ],
        ),
      ),
    );
  }
}
