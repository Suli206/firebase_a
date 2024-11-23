import 'package:firebase_a/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class NotesWid extends StatelessWidget {
  const NotesWid({
    super.key,
    required this.text1,
    required this.text2,
    required this.onDelete,
    required this.onChange,
  });
  final String text1;
  final String text2;
  final Function() onDelete;
  final Function() onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 160,
          width: MediaQuery.of(context).size.width,
          color: Colors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  text1,
                  style: AppTextStyles.s18W500(),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                text2,
                style: AppTextStyles.s18W500(),
                maxLines: 6,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: onChange,
              icon: const Icon(Icons.change_circle_outlined),
            ),
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete),
            ),
          ],
        )
      ],
    );
  }
}
