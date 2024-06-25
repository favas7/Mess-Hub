// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:messhub/color/color.dart';
import 'package:messhub/functions/details_edit_textfield.dart';
import 'package:messhub/widgets/bottomNavAdmin.dart';

class AdminProfileEdit extends StatefulWidget {
  const AdminProfileEdit({super.key});

  @override
  State<AdminProfileEdit> createState() => _AdminProfileEditState();
}

class _AdminProfileEditState extends State<AdminProfileEdit> {
    final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  File? _imageFile;
  User? user;

  @override
  void initState() {
    super.initState();
    user = _auth.currentUser;
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    if (user != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('userDetails')
          .doc(user!.email)
          .get();

      setState(() {
        _username.text = userData['name'];
        _email.text = userData['email'];
        _phone.text = userData['phone'];
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _updateUserData() async {
    if (user != null) {
      await FirebaseFirestore.instance.collection('userDetails').doc(user!.email).update({
        'name': _username.text,
        'email': _email.text,
        'phone': _phone.text,
      });
    }
    // Navigate back to profile screen after updating data
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BottomNav()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Edit Profile"),
        leading: IconButton(onPressed: (){Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BottomNav()),
    );
    }, 
    icon: const Icon(Icons.arrow_back_ios)),
      ),
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned(
              bottom: MediaQuery.of(context).size.height / 1.33,
              left: MediaQuery.of(context).size.width / 2.5,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _imageFile != null
                    ? FileImage(_imageFile!)
                    : const AssetImage('assets/PlaceHolder/Placeholder_view_vector.svg.png') as ImageProvider,
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 1.43,
              left: MediaQuery.of(context).size.width / 2.4,
              child: TextButton(
                onPressed: _pickImage,
                child: const Text('Add Image'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  detailsTextField(controller: _username, hintText: 'User Name'),
                  const SizedBox(
                    height: 30,
                  ),
                  detailsTextField(controller: _email, hintText: 'Email'),
                  const SizedBox(
                    height: 30,
                  ),
                  detailsTextField(controller: _phone, hintText: 'Phone'),
                  const Spacer(),
                  Center(
                    child: TextButton(
                      onPressed: _updateUserData,
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(mainColor),
                      ),
                      child: const Text(
                        '  Update  ',
                        style: TextStyle(
                          color: black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    
    );
  }
}