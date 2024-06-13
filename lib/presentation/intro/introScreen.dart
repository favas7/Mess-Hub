// ignore_for_file: prefer_const_constructors, file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:messhub/presentation/intro/introSlide.dart';
import 'package:messhub/functions/pageIndicator.dart';
import 'package:messhub/color/widgets/bottomNavUser.dart';

class IntroScreen1 extends StatefulWidget {
  const IntroScreen1({Key? key}) : super(key: key);

  @override
  State<IntroScreen1> createState() => _IntroScreen1State();
}

class _IntroScreen1State extends State<IntroScreen1> {
  final PageController _controller = PageController(initialPage: 0);

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: introData.length,
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return IntroSlide(
                image: introData[index]['image'],
              );
            },
          ),
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pageIndicator(),
            ),
          ),
        ],
      ),
      floatingActionButton: currentPage == introData.length - 1
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomNavUser()),
                );
              },
              child: Icon(Icons.done),
            )
          : null,
    );
  }



}


