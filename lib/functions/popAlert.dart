// ignore_for_file: unused_element, file_names, prefer_const_constructors, avoid_types_as_parameter_names, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messhub/color/color.dart';
import 'package:messhub/presentation/welcomeScreen/welcomeScreen.dart';

void showAlertDialog(BuildContext context, String s, Duration duration) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close',style: TextStyle(color: mainColor),),
                ),Spacer(),
                TextButton(onPressed: (){
                  signOutFromFirebase();
                  Navigator.pushAndRemoveUntil(
                      context, MaterialPageRoute(builder: (context) => WelcomeScreen(),),(route) => false,
                    );
                }, child: Text('sure',style: TextStyle(color: mainColor),))
              ],
            ),
          ],
        );
      },
    );
    }
      Future<void> signOutFromFirebase() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  await auth.signOut();
  print('Signed out successfully!'); // Optional: Print confirmation message
}