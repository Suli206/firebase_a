import 'package:firebase_a/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(226, 3, 7, 120),
        title: Text(
          'Chat',
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
