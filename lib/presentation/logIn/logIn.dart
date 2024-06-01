// ignore_for_file: use_build_context_synchronously, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:messhub/color/color.dart';
import 'package:messhub/presentation/logIn/forgotPass.dart';
import 'package:messhub/presentation/welcomeScreen/welcomeScreen.dart';
import 'package:messhub/presentation/signUp/signup.dart';
import 'package:messhub/presentation/splash/adminSplash.dart';
import 'package:messhub/widgets/bottomNavUser.dart';

class Login extends StatefulWidget {
 const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

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

bool _obscureText = true;

class _LoginState extends State<Login> {
  final TextEditingController _emailLogIn = TextEditingController();
  final TextEditingController _passwordLogIn = TextEditingController();
  final GlobalKey<FormState> _formKeyLogIn = GlobalKey<FormState>();

  void _clearForm() {
    _emailLogIn.clear();
    _passwordLogIn.clear();
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
                'assets/Login/Screenshot 2024-04-03 105949.png',
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, right: 350),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()),);
                    },
                    icon: const Icon(Icons.arrow_back_ios, color: Color.fromRGBO(17, 23, 25, 1)),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 300),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Form(
                    key: _formKeyLogIn,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Email'),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _emailLogIn,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!isEmailValid(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "   Your Email or Phone",
                            hintStyle: TextStyle(
                              color: textFieldColor,
                            ),
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: mainColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('Password'),
                        const SizedBox(height: 20),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            } else if (!containsUpperCase(value)) {
                              return 'Password must contain at least one uppercase letter';
                            } else if (!containsLowerCase(value)) {
                              return 'Password must contain at least one lowercase letter';
                            } else if (!containsDigit(value)) {
                              return 'Password must contain at least one digit';
                            } else if (!containsSpecialCharacter(value)) {
                              return 'Password must contain at least one special character';
                            } else if (validatePassword(value) != null) {
                              return 'Please enter a valid Password';
                            }
                            return null;
                          },
                          controller: _passwordLogIn,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            hintText: "   Password",
                            hintStyle: TextStyle(
                              color: textFieldColor,
                            ),
                            suffixIcon: IconButton(onPressed: (){
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            }, icon: Icon(Icons.remove_red_eye)),
                            suffixIconColor: textFieldColor,
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: mainColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const forgotPass()),);
                            },
                            child: const Text(
                              'Forgot password',
                              style: TextStyle(
                                color: mainColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              if (_formKeyLogIn.currentState!.validate()) {
                                signInWithEmailAndPassword();
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(mainColor),
                            ),
                            child: const Text(
                              'LOG IN',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2 - 100,
                            ),
                            const Text("Don't have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const signUp()),
                                );
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: mainColor,
                                ),
                              ),
                            ),
                          ],
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

  Future<void> signInWithEmailAndPassword() async {
    if (_emailLogIn.text == 'admin@gmail.com' && _passwordLogIn.text == 'Admin@123') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const adminSplash(),
        ),
        (route) => false,
      );
      _clearForm();
    } else if (_emailLogIn.text == 'owner@gmail.com' && _passwordLogIn.text == 'Owner@123') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const adminSplash(),
        ),
        (route) => false,
      );
      _clearForm();
    } else {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailLogIn.text,
          password: _passwordLogIn.text,
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavUser(),
          ),
          (route) => false,
        );
        _clearForm();
      } catch (e) {
        showSuccessMessage(context, "Email or password is incorrect", duration: 2);
      }
    }
  }

  bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  } else if (value.length < 6) {
    return 'Password must be at least 6 characters long';
  } else if (!containsUpperCase(value)) {
    return 'Password must contain at least one uppercase letter';
  } else if (!containsLowerCase(value)) {
    return 'Password must contain at least one lowercase letter';
  } else if (!containsDigit(value)) {
    return 'Password must contain at least one digit';
  } else if (!containsSpecialCharacter(value)) {
    return 'Password must contain at least one special character';
  }
  return null;
}

bool containsUpperCase(String value) {
  return value.contains(RegExp(r'[A-Z]'));
}

bool containsLowerCase(String value) {
  return value.contains(RegExp(r'[a-z]'));
}

bool containsDigit(String value) {
  return value.contains(RegExp(r'[0-9]'));
}

bool containsSpecialCharacter(String value) {
  return value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
}
