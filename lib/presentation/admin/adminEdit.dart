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
        child: Padding(
          padding: const EdgeInsets.all(14.0), 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(widget.data['mainimage'],
                  height: 300,
                  fit: BoxFit.fill,), 
                  ],
              ),
                    const SizedBox(
                      height: 20,
                    ),const Text('About',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),),
                  const Text('Description about the mess in detail to understand customer. Description about the mess in detail to understand '),
                  const SizedBox(
                    height: 20,
                  ),
                    // const Text('MENU',style: TextStyle(
                    //   fontWeight: FontWeight.bold,
                    //   fontSize: 20
                    // ),),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(onPressed: (){},style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(mainColor),
                        ),
                        child: const Text(
                          '                 CLICK HERE FOR MENU                 ',  
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                        ),),
                        const SizedBox(
                          height: 30,
                        ),
                        
                    
              
            ],
          ),
        ),
      ),
    );
  }
}
// Text(widget.data['messname'])