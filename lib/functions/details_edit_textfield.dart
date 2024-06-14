import 'package:flutter/material.dart';
import 'package:messhub/color/color.dart';

Widget detailsTextField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(' $hintText' , 
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ), 
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                color: mainColor,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                color: mainColor,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                color: mainColor,
                width: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget heading({
    required String heading

  })
  {
    return  Text(heading ,style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),);
  }