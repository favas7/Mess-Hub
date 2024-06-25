import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:messhub/color/color.dart';

void showSuccessMessage(BuildContext context, String message, {int duration = 2}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: mainColor,
    textColor: white,
    fontSize: 16.0,
    timeInSecForIosWeb: duration, // Duration in seconds
  );
}