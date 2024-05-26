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

TextEditingController _email = TextEditingController();
void _clearmail(){
    _email.clear();
  }

class _forgotPassState extends State<forgotPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
             height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/Login/ForgotPass.png',
            fit: BoxFit.fill,),), 
            
       Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60,right: 350),
            child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Login()),);
                  
                    }, icon: const Icon(Icons.arrow_back_ios,color: Color.fromRGBO(17, 23, 25, 1),)),
          ),
          const SizedBox(
            height: 80,
          ) 
          ,const Text('Reset Password' ,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: black
          ),),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,),
            child: Column(
              
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('Please enter your email address to\n         request a password reset',style: 
                  TextStyle(
                      color: textFieldColor
                    ),),
                ),
                const SizedBox(
                  height: 20,
                ),
                
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                    hintText: "   Email adress",
                    hintStyle: TextStyle(
                      color: textFieldColor
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
              const SizedBox(height: 4),
                const SizedBox(
                  height: 50,
                ),
                
              Center(
                child: SizedBox(
                  height: 70,
                  child: TextButton(onPressed: (){
                    resetPassword();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const verification()),);
                    _clearmail();
                  },
                       style: ButtonStyle(
                        maximumSize: WidgetStateProperty.all(Size(
                          MediaQuery.of(context).size.height - 580 , double.infinity
                        )),
                        backgroundColor: WidgetStateProperty.all<Color>(const Color.fromRGBO(254, 114, 76, 1)),
                       ), child: const Text('             Sent New Password             ',
                       style: TextStyle(
                         fontSize: 15 ,   
                         fontWeight: FontWeight.bold,
                         color: white
                       ),),),
                ),
              ),
              ],
            ),
          )
        ],
      ),
   ]),
    );
    
  }
  Future<void> resetPassword() async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: _email.text.trim());
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c) =>  const Login()));
  } catch (ex) {
    if (ex is FirebaseAuthException) {
      // Handle FirebaseAuthException here
      print('Failed to send password reset email: ${ex.message}');
      // You can show an error message to the user
    } else {
      // Handle other exceptions
      print('An error occurred: $ex');
    }
  }
}

}