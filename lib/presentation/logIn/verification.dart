// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:messhub/color/color.dart';
import 'package:messhub/presentation/logIn/logIn.dart';

class verification extends StatefulWidget {
  const verification({super.key});

  @override
  State<verification> createState() => _verificationState();
}

class _verificationState extends State<verification> {
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
            
        Center(
         child: Column(
          children: [
            const SizedBox(height: 100,), 
            const SizedBox(
              height: 80,
            ) 
            ,const Text('Verification code' ,
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
                    child: Text('Password reset has sent to the email \n           Please check your mail',style: 
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
                  
                const SizedBox(height: 4),
                  const SizedBox(
                    height: 50,
                  ),
                TextButton(
                              onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
                  },
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  mainColor,
                                ),
                              ),
                              child: const Text(
                                'Return to Log In',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            )
                ],
              ),
            )
            
          ],
               ),
       ),
  ]),
    );
  }
}