import 'package:firebase_a/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class SettWid extends StatelessWidget {
  const SettWid({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
  });
  final String text;
  final Function() onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 16,
          right: 20,
        ),
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(224, 1, 1, 2),
              Color.fromARGB(255, 128, 33, 33),
            ],
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppTextStyles.s18W500(color: Colors.white),
            ),
            const Spacer(),
            Icon(icon ?? Icons.exit_to_app, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
