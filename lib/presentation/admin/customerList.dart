// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:messhub/functions/popAlert.dart';

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
          Center(child: IconButton(onPressed: (){
            showAlertDialog(context,"",Duration.zero);
          }, icon: const Icon(Icons.logout_rounded),)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.abc))
          
        ],
           
        ),
      ),
    );
  }
}