// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:messhub/color/color.dart';

Widget createTextBox(String header,String data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
         Text(
          ' $header',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: adminBg
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Text(data),
          ),
        ),
      ],
    );
  }