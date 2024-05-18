import 'package:flutter/material.dart';
import 'package:messhub/color/color.dart';

Widget customTextField({
  required String labelText,
  required TextEditingController controller,
  String? hintText,
  String? Function(String?)? validator,
  TextInputType? textInputType
   // Validator function parameter
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        labelText,
        style: const TextStyle(
          color: mainColor,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      const SizedBox(height: 12),
      TextFormField(
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
             borderSide: const BorderSide(
              color: mainColor,
              width: 2.0,
            ),
          ),
          fillColor: white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: mainColor,
              width: 2.0,
            ),
            
            borderRadius: BorderRadius.circular(20),
          ),
          
        ),
        validator: validator, // Set validator function
      ),
    ],
  );
}
