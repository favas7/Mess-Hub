// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:messhub/color/color.dart';
import 'package:messhub/presentation/admin/customerList/messDetailsAdd.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({super.key});

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(children: [
          Container(height: 100),
          IconButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const MessDetailsAdd()));
                            }, icon: const Icon(Icons.add_rounded,
                              color: textFieldColor,
                              size: 50,
                              ))
          ],
           
        ),
      ),
    );
  }
}