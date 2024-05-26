// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:messhub/color/color.dart';
import 'package:messhub/presentation/welcomeScreen/welcomeScreen.dart';
class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome(context); // Pass the context to navigateToHome method
  }

  void navigateToHome(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:mainColor,
      body: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: [
          Center(
            child:
             Container(
              width: 100, 
              height: 100, 
             decoration: BoxDecoration(
                borderRadius : BorderRadius.circular(20),
                color: white
              )  ,
              
               child: Lottie.asset('assets/lottieFiles/Animation - 1716625696831.json' ,
               
               animate: true,
              height: MediaQuery.of(context).size.height * .45, 
                       width:
                       MediaQuery.of(context).size.width / 2, ),
                    
             )// Make it responsive for different screens
          ),
          Image.asset('assets/Splash/Screenshot_2024-04-02_183736-removebg-preview.png',
          width: 200 ,)
          
        ],
      )
    ); // You might return your splash screen widget here
  }
}
