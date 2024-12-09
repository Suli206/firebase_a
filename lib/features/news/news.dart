import 'package:firebase_a/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class News extends StatefulWidget {
  const News({super.key});
  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(226, 3, 7, 120),
        title: Text(
          'News',
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
