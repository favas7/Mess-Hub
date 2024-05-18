  // ignore_for_file: file_names

  import 'package:flutter/material.dart';
import 'package:messhub/functions/indicator.dart';

  int currentPage = 0;

  List<Map<String, String>> introData = [
    {
      'image': 'assets/IntroScreen/Intro1.png',
    }, 
    {
      'image': 'assets/IntroScreen/Intro2.png',
    },
    {
      'image': 'assets/IntroScreen/Intro3.png',
    },
  ];

List<Widget> pageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < introData.length; i++) {
      indicators.add(indicator(i == currentPage));
    }
    return indicators;
  }
