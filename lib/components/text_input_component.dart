import 'package:flutter/material.dart';

//making email & password input field holder that can implement on other .dart files
class TextInputComponent extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;
  final TextInputType textInputType;

  const TextInputComponent({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230, //set width input field holder
      height: 40, //set width input field holder
      child: TextField(
        controller: controller, //set text holder
        obscureText: obscureText, //allow hide & visible text
        obscuringCharacter: '@',
        keyboardType: textInputType, //type of text can be input
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFCECECE),
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xFF7D7D7D),
                width: 2,
                strokeAlign: BorderSide.strokeAlignOutside),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
          border: InputBorder.none,
        ),

        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
