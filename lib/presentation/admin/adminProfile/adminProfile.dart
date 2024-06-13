// ignore_for_file: prefer_const_constructors, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:messhub/color/color.dart';

class adminProfile extends StatelessWidget {
  const adminProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset('assets/adminProfile/profileBg.png',
          fit: BoxFit.cover,),
        ),
        Positioned(
          top: 50, left: 165,
          child: CircleAvatar(
            radius: 50,
            child: Image.asset('name'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0), 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              SizedBox(
                height: 250,
              ),
              Text('Name',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),),
              SizedBox(
                height: 10,
              ),
          Container(
            height: 50,
            width: double.infinity,
            color: adminBg,
            child: Padding(
              padding: const EdgeInsets.only(top: 10,left: 20),
              child: Text('NAME OF ADMIN'),
            ),
          )
            ],
          ),
        )
        ]
      )
    );
  }
}




