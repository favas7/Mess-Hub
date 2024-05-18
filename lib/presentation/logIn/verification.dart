// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:messhub/color/color.dart';

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
            
       const Center(
         child: Column(
          children: [
            SizedBox(height: 100,), 
            SizedBox(
              height: 80,
            ) 
            ,Text('Verification code' ,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: black
            ),),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15,right: 15,),
              child: Column(
                
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text('Password reset has sent to the email \n           Please check your mail',style: 
                    TextStyle(
                        color: textFieldColor
                      ),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  
                  SizedBox(
                    height: 20,
                  ),
                  
                SizedBox(height: 4),
                  SizedBox(
                    height: 50,
                  ),
                
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