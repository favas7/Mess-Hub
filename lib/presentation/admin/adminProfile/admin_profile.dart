// ignore_for_file: prefer_const_constructors, camel_case_types,

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messhub/color/color.dart';
import 'package:messhub/functions/popAlert.dart';
import 'package:messhub/functions/profileTextBox.dart';
import 'package:messhub/presentation/admin/adminProfile/admin_profile_edit.dart';
late Map<String, dynamic> loginUser;

class AdminProfile extends StatefulWidget {
  const AdminProfile({super.key});

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

Future<void> _loadUserData(Function(Map<String, String>) updateUser) async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    DocumentSnapshot userData = await FirebaseFirestore.instance
        .collection('userDetails')
        .doc(user.email)
        .get();

    String userName = userData['name'];
    String email = userData['email'];
    String phone = userData['phone'];
    loginUser={
      'username':userName,
      'email':email,
      'phone':phone
    };

    updateUser({
      'name': userName,
      'email': email,
      'phone': phone,
    });
  }
}

class _AdminProfileState extends State<AdminProfile> {
   Map<String, String> userData = {
    'name': '',
    'email': '',
    'phone': '',
  };

  @override
  void initState() {
    super.initState();
    _loadUserData((data) {
      setState(() {
        userData = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size= MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height, 
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/adminProfile/profileBg.png'),
          fit: BoxFit.cover),
          
        ),
        child: Padding(
          padding: const EdgeInsets.all(14), 
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30,top: 33),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/PlaceHolder/Placeholder_view_vector.svg.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  AdminProfileEdit()),
                    );
                  },
                  child: const Text('Edit Profile'),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              
                    
                    createTextBox('NAME', userData['name'] ?? ''),
                    const SizedBox(
                      height: 30,
                    ),
                    
                    createTextBox('EMAIL', userData['email'] ?? ''),
                    const SizedBox(
                      height: 30,
                    ),
                    createTextBox('PHONE NUMBER', userData['phone'] ?? ''),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        showAlertDialog(context, "", Duration.zero);
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(mainColor),
                      ),
                      child: const Text(
                        'LOG OUT',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
            ],
          ),
        )
          
        )
        );
  }
}




