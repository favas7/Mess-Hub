import 'package:flutter/material.dart';
import 'package:messhub/color/color.dart';
import 'package:messhub/functions/details_edit_textfield.dart';
import 'package:messhub/presentation/User/user_profile/profile.dart';

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
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          },
        child: Stack(
          children: [
            SizedBox(
            height: MediaQuery.of(context).size.height, 
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/adminProfile/profileBg.png',
            fit: BoxFit.cover,),
          ),
          Padding(
                  padding: const EdgeInsets.only(top: 60,left: 20),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()),);
                    }, 
                    icon: const Icon(Icons.arrow_back_ios, color: Color.fromRGBO(17, 23, 25, 1)),
                  ),
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