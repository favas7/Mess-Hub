// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:messhub/color/color.dart';

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
      appBar: AppBar(
        title: Text(widget.data['messname']),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.width/1.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: adminBg,
                  boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 15,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],borderRadius: BorderRadius.circular(25) 
                ),
              child: Stack(
                children: [
                  Positioned(
                    left: 100,
                    child: Image.network(widget.data['mainimage']
                    ,fit: BoxFit.cover,)) ,
                    
                   
                ],
              ),
                        ),
            ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: adminBg,
                      boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 15,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]
                    ),
                  ),
                  const SizedBox(
                    height:50
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: adminBg,
                      boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 15,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]
                    ),
                  ),const SizedBox(
                    height:50
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: adminBg,
                      boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 15,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]
                    ),
                  )
            
          ],
        ),
      ),
    );
  }
}
// Text(widget.data['messname'])