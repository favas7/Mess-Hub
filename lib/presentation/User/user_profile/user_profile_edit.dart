import 'package:flutter/material.dart';
import 'package:messhub/color/color.dart';
import 'package:messhub/functions/details_edit_textfield.dart';

class UserProfileEdit extends StatefulWidget {
  const UserProfileEdit({super.key});

  @override
  State<UserProfileEdit> createState() => _UserProfileEditState();
}
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();



class _UserProfileEditState extends State<UserProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          },
        child: Stack(
          children: [
           Positioned(
            bottom: MediaQuery.of(context).size.height/1.33,
          left: MediaQuery.of(context).size.width/2.5, 
            child: const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/PlaceHolder/Placeholder_view_vector.svg.png')
              ),
          ),
          Positioned(
             bottom: MediaQuery.of(context).size.height/1.43,
          left: MediaQuery.of(context).size.width/2.4, 
            child: TextButton(onPressed: (){}, 
            child: const Text('Add Image'))),
          
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
                  child: TextButton(onPressed: (){}, 
                  style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(mainColor),
                        ),
                         child: const Text('  Update  ',style: TextStyle(
                          color: black
                         ),)),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          )
          ]
        ),
      )
    );
  }
}