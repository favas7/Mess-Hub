// ignore_for_file: camel_case_types, unused_import, file_names

import 'package:flutter/material.dart';
import 'package:messhub/color/color.dart';
import 'package:messhub/presentation/logIn/logIn.dart';
import 'package:messhub/presentation/signUp/signup.dart';
import 'package:messhub/presentation/splash/adminSplash.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/WelcomeScreen/monika-grabkowska-9jdyCy-bMC4-unsplash.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Padding( 
              padding: EdgeInsets.only(right: 60),
              child: Text("Welcome to",style: TextStyle(
                color: black,
                fontSize: 55,
                fontWeight: FontWeight.bold,
              ),),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 140),
              child: Text("Mess Hub",style: TextStyle(
                  color: mainColor,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 140),
              child: Text('Your favourite foods delivered \n fast at your door.'),
            ),
            const SizedBox(
              height: 300, 
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        mainColor,
                      ),
                    ),
                    child: const Text(
                      '                          LOG IN                          ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const signUp()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      mainColor,
                    ),
                  ),
                  child: const Text(
                    '                          SIGN UP                          ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                ),
                Container(
                  height: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
