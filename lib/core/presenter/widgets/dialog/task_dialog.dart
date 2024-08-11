import 'package:flutter/material.dart';

import '../text/app_text.dart';

class TaskDialog extends StatelessWidget {
  const TaskDialog({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      title: Column(
        children: [
          AppText(
            title,
            fontSize: FontSize.medium,
            style: MyTextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Icon(
                Icons.done,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
