// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AdminDetailsEdit extends StatefulWidget {
  final Map<String,dynamic>data;
   const AdminDetailsEdit({super.key, required int index, required this.data});

  @override
  State<AdminDetailsEdit> createState() => _AdminDetailsEditState();
}

class _AdminDetailsEditState extends State<AdminDetailsEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(widget.data['messname'])
        ],
      ),
    );
  }
}