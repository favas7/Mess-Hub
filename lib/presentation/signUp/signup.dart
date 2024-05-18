// ignore_for_file: camel_case_types, use_key_in_widget_constructors, avoid_print, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messhub/color/color.dart';
import 'package:messhub/presentation/intro/introScreen.dart';
import 'package:messhub/presentation/logIn/logIn.dart';
import 'package:messhub/presentation/welcomeScreen/welcomeScreen.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key});

  @override
  State<signUp> createState() => _SignupState();
}

TextEditingController _name = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();
TextEditingController _confirmPassword = TextEditingController();

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

bool _obscureText1 = true;
bool _obscureText2 = true;

class _SignupState extends State<signUp> {
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      // Handle errors here, such as displaying an error message to the user
      print("Error creating user: $e");
    }
  }
void _clearForm() {
    _email.clear(); 
    _name.clear();
    _password.clear();// Clear the text field
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/Login/Screenshot 2024-04-03 105949.png',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 10),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                );
              },
              icon: const Icon(Icons.arrow_back_ios, color: backIconColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 150,
                ),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: black,
                  ),
                ),
                const SizedBox(height: 50),
                CustomTextFormField(
                  controller: _name,
                  labelText: 'Full Name',
                  hintText: '  Full Name',
                  keyValue: _formKey1,
                  ObscureText: false,
                  validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Name'; 
                        }
                        return null;
                      },
                  hintStyle: const TextStyle(
                    color: textFieldColor,
                  ),
                  borderColor: mainColor,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: _email,
                  labelText: 'Email',
                  hintText: '  Email',
                  keyValue: _formKey,
                  ObscureText: false,
                  validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!isEmailValid(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                  hintStyle: const TextStyle(
                    color: textFieldColor,
                  ),
                  borderColor: mainColor,
                  
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: _password,
                  labelText: 'Password',
                  hintText: '  Password',
                  ObscureText: _obscureText1,
                  keyValue: _formKey2,
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      _obscureText1 = !_obscureText1;
                    });
                  },icon: const Icon(Icons.remove_red_eye)),
                  suffixIconColor: textFieldColor,
                  validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Password';
                            } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                            }
                         else if (!containsUpperCase(value)) {
                              return 'Password must contain at least one uppercase letter';
                            }

                          else if (!containsLowerCase(value)) {
                              return 'Password must contain at least one lowercase letter';
                            }

                          else if (!containsDigit(value)) {
                              return 'Password must contain at least one digit';
                            }

                          else if (!containsSpecialCharacter(value)) {
                              return 'Password must contain at least one special character';
                            }
                        else if (validatePassword(value) != null) {
                          return 'Please enter a valid Password';
                        }
                        
                        return null;
                      },
                  hintStyle: const TextStyle(
                    color: textFieldColor,
                  ),
                  borderColor: mainColor,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: _confirmPassword,
                  labelText: 'Confirm Password', 
                  hintText: ' Confirm Password',
                  ObscureText: _obscureText2,
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      _obscureText2 = !_obscureText2;
                    });
                  },icon: const Icon(Icons.remove_red_eye)),
                  suffixIconColor: textFieldColor,
                  validator: (value) {
                        if (value != _password.text ) {
                          return 'Password does not match'; 
                            } 
                        return null;
                      },
                  hintStyle: const TextStyle(
                    color: textFieldColor,
                  ),
                  borderColor: mainColor,
                ),
                const SizedBox(height: 30),
                Center(
                  child: TextButton(
                    onPressed: () {
                      if ( _name.text.isEmpty) {
                        showSuccessMessage(context, "Please enter your Name", duration: 2);
                        }
                      else if (_email.text.isEmpty) {
                        showSuccessMessage(context, "Please enter your email", duration: 2);
                          
                        } else if (!isEmailValid(_email.text)) {
                          showSuccessMessage(context, "Please enter a valid email address", duration: 2);
                         }
                      else if (_password.text.isEmpty) {
                        showSuccessMessage(context, "Please enter your Password", duration: 2);
                          }
                      else if(_password.text.length < 6){
                          showSuccessMessage(context, "Password must be at least 6 characters long", duration: 2);
                        }
                      else if (!containsUpperCase(_password.text)) {
                          showSuccessMessage(context, "Password must contain at least one uppercase letter", duration: 2);
                             }

                      else if (!containsLowerCase(_password.text)) {
                            showSuccessMessage(context, "Password must contain at least one lowercase letter", duration: 2);
                              }

                      else if (!containsDigit(_password.text)) {
                            showSuccessMessage(context, "Password must contain at least one digit", duration: 2);
                             }

                      else if (!containsSpecialCharacter(_password.text)) {
                            showSuccessMessage(context, "Password must contain at least one special character", duration: 2);
                              }
                      else if (validatePassword(_password.text) != null) {
                          showSuccessMessage(context, "Please enter a valid Password", duration: 2);
                         }
                      else 
                      // if (
                          // _formKey.currentState!.validate() &&
                          // _formKey1.currentState != null &&
                          // _formKey1.currentState!.validate() &&
                          // _formKey2.currentState != null &&
                          // _formKey2.currentState!.validate()) 
                          {
                        // If all form fields are valid, proceed with signup
                        setState(() {
                          createUserWithEmailAndPassword(
                          email: _email.text,
                          password: _password.text,
                        );
                        _clearForm();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const IntroScreen1()),
                        );
                        });
                      }
                       
                    },
 
                      

                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(mainColor),
                    ),
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 100,
                    ),
                    const Text("Already have an account"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>  const Login()),
                        );
                      },
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          color: mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
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




bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }

Widget CustomTextFormField({
  String? labelText,
  String? hintText,
  TextStyle? hintStyle,
  Key? keyValue,
  FormFieldValidator<String>? validator,
  
  required Color borderColor,
  required TextEditingController controller,
  required bool ObscureText, 
  IconButton? suffixIcon, 
  Color? suffixIconColor, 
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(labelText!),
      TextFormField(
        controller: controller,
        key: keyValue,
        validator: validator,
        obscureText: ObscureText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
          suffixIconColor: suffixIconColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
              width: 2.0,
            ),
          ),
        ),
      ),
    ],
  );
  
}
