import 'package:flutter/material.dart';

Widget customTextFormField({
  required String labelText,
  required String hintText,
  required TextStyle hintStyle,
  required FormFieldValidator<String> validator,
  required Color borderColor,
  required TextEditingController controller,
  required bool obscureText,
  IconButton? suffixIcon,
  Color? suffixIconColor,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(labelText),
      TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
          suffixIconColor: suffixIconColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
              width: 2.0,
            ),
          ),
        ),
      ),
    ],
  );
}
