import 'package:flutter/material.dart';
import 'package:messhub/color/color.dart';

void showDeleteAlertDialog(BuildContext context, String title, String message, VoidCallback onDelete) {
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      TextButton(
        child: const Text("Cancel",style: TextStyle(
          color: mainColor
        ),),
        onPressed: () {
          Navigator.of(context).pop(); // Close the dialog
        },
      ),
      TextButton(
        child: const Text("Delete",style: TextStyle(
          color: mainColor
        ),),
        onPressed: () {
          Navigator.of(context).pop(); // Close the dialog
          onDelete(); // Perform the delete action
        },
      ),
    ],
  );

  // Show the dialog
  showDialog(
    context: context,
    barrierDismissible: false, // Prevents the dialog from closing by tapping outside
    builder: (BuildContext context) {
      return alert;
    },
  );
}