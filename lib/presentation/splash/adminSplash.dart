// ignore_for_file: camel_case_types, library_private_types_in_public_api, use_build_context_synchronously, avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:messhub/color/widgets/bottomNavAdmin.dart';
class adminSplash extends StatefulWidget {
  const adminSplash({Key? key}) : super(key: key);

  @override
  _adminSplashState createState() => _adminSplashState();
}

class _adminSplashState extends State<adminSplash> {
  @override
  void initState() {
    super.initState();
    navigateToAdminHome(context); // Pass the context to navigateToAdminHome method
  }

  void navigateToAdminHome(BuildContext context) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  const BottomNav()),
      );
    } catch (e) {
      // Handle navigation error, if any
      print('Error navigating to adminHome: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/admin/adminSplash.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up resources here if needed
    super.dispose();
  }
}
