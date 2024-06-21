import 'package:flutter/material.dart';
import 'package:messhub/color/color.dart';
import 'package:messhub/functions/popAlert.dart';
import 'package:messhub/functions/profileTextBox.dart';
import 'package:messhub/presentation/User/user_profile/user_profile_edit.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        const Positioned(
          top: 73, left: 165,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/PlaceHolder/Placeholder_view_vector.svg.png')
            ),
        ),
        Positioned(
          top: 170, left: 170,
          child: TextButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const UserProfileEdit()),
                      );
                    }, child: const Text('Edit Profile'))),

        
        Padding(
          padding: const EdgeInsets.all(14.0), 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 250),
              createTextBox('NAME', 'NAME OF USER'),
              const SizedBox(
                height: 30,
              ),
              createTextBox('EMAIL', 'EMAIL OF USER'),
            const SizedBox(
                height: 30, 
              ),
              createTextBox('PHONE NUMBER', 'PHONE NUMBER OF USER'),
              const Spacer(),
              Center(
                child: TextButton(onPressed: (){
                  
                showAlertDialog(context,"",Duration.zero); 
                },
                style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(mainColor),
                      ),
                       child: const Text('LOG OUT',style: TextStyle(
                        color: black
                       ),)),
              )
            ],
          ),
        )
        ]
      )
    );
  }
}