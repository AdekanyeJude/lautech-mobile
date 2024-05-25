import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// bool visibilty = false;

Widget textFieldUsername(hintText, errorText, obscure, controller, {keyboard}) {
  return Container(
    height: 52,
    decoration: BoxDecoration(
      color: (errorText == true) ? HexColor('#FCF3F2') : HexColor("#F5F5F5"),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    child: TextField(
      controller: controller,
      autocorrect: true,
      //autofocus: true,
      obscureText: obscure,
      enableSuggestions: true,
      style: TextStyle(
          fontFamily: 'Source Sans 3',
          color: HexColor("#1A284B").withOpacity(0.6),
          fontSize: 14,
          fontWeight: FontWeight.w400),
      keyboardType: keyboard ?? TextInputType.name,
      decoration: InputDecoration(
        // fillColor: HexColor("#FAF8F7"),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),

        hintText: hintText,
        hintStyle: TextStyle(
            fontFamily: 'Source Sans 3',
            color: HexColor("#1A284B").withOpacity(0.6),
            fontSize: 14,
            fontWeight: FontWeight.w400),
        // prefixIcon: Icon(Icons.email, color: Colors.grey[400]),
        contentPadding: const EdgeInsets.only(top: 16, left: 20),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    ),
  );
}
