// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget imageContainer(BuildContext context, String imagePath) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
    ),
  );
}