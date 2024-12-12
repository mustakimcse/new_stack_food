import 'package:flutter/material.dart';

class Dialogs {
  // Show a message in a SnackBar
  static void showMsgSnackBar(BuildContext context, String title, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black, // You can customize the background color
        duration: const Duration(seconds: 2), // Duration for the SnackBar
      ),
    );
  }

  // Show a progress bar dialog
  static void showProgressBar(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing by tapping outside
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  // Hide the progress bar dialog
  static void hideProgressBar(BuildContext context) {
    Navigator.of(context).pop(); // Close the dialog
  }
}
