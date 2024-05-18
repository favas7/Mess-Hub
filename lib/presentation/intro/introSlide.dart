// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class IntroSlide extends StatelessWidget {

  String? image;

  IntroSlide({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image!),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}