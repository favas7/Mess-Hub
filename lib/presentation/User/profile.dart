import 'package:flutter/material.dart';
import 'package:messhub/functions/popAlert.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: SingleChildScrollView(
        child: Column(children: [
          Container(height: 100),
          Center(child: IconButton(onPressed: (){
            showAlertDialog(context,"",Duration.zero);
          }, icon: const Icon(Icons.logout_rounded),)),
          
        ],
          
        ),
      ),
    
    );
  }
}