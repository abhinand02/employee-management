import 'package:flutter/material.dart';

void showDeleteConfirmationDialog(
    {required BuildContext context,
    required String title,
    required String content,
    required String buttonText,
    required Function() onClick}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              onClick();
              Navigator.of(context).pop();
            },
            child: Text(buttonText),
          ),
        ],
      );
    },
  );
}
