// ignore: file_names
// ignore_for_file: camel_case_types, file_names, duplicate_ignore, use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messhub/color/color.dart';
import 'package:messhub/presentation/logIn/logIn.dart';
import 'package:messhub/presentation/logIn/verification.dart';

class forgotPass extends StatefulWidget {
  const forgotPass({super.key});

  @override
  State<forgotPass> createState() => _forgotPassState();
}

class _forgotPassState extends State<forgotPass> {
  final TextEditingController _email = TextEditingController();
  final GlobalKey<FormState> _forgotEmailKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  void _clearEmail() {
    _email.clear();
  }

  Future<void> resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _email.text.trim());
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c) =>  const verification()));
    } catch (ex) {
      if (ex is FirebaseAuthException) {
        // Handle FirebaseAuthException here
        print('Failed to send password reset email: ${ex.message}');
        // You can show an error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send password reset email: ${ex.message}')),
        );
      } else {
        // Handle other exceptions
        print('An error occurred: $ex');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: $ex')),
        );
      }
    }
  }

  bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/Login/ForgotPass.png',
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, right: 350),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    icon: const Icon(Icons.arrow_back_ios, color: Color.fromRGBO(17, 23, 25, 1)),
                  ),
                ),
                const SizedBox(height: 80),
                const Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: black),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                    key: _forgotEmailKey,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Please enter your email address to\nrequest a password reset',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: textFieldColor),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!isEmailValid(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Email address",
                            hintStyle: TextStyle(color: textFieldColor),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: mainColor, width: 2.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        Center(
                          child: SizedBox(
                            height: 70,
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {
                                if (_forgotEmailKey.currentState!.validate()) {
                                  resetPassword();
                                  _clearEmail();
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  mainColor,
                                ),
                              ),
                              child: const Text(
                                'Send New Password',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
