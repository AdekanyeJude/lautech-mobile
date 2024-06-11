import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// bool visibilty = false;

Widget textFieldUsername(hintText, errorText, obscure, controller,
    {keyboard, fillwhiteColor, onTap, maxLength}) {
  return Container(
    height: 52,
    decoration: BoxDecoration(
      color: fillwhiteColor == true
          ? HexColor("#FFFFFF")
          : (errorText == true)
              ? HexColor('#FCF3F2')
              : HexColor("#F5F5F5"),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    child: TextField(
      maxLength: maxLength,

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
        counter: SizedBox(),
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
      onTap: onTap,
    ),
  );
}

Widget textFieldLevel(
  String hintText,
  String errorText,
  bool obscure,
  TextEditingController controller, {
  TextInputType? keyboard,
  bool? fillwhiteColor,
  Function()? onTap,
  int? maxLength,
}) {
  return Container(
    height: 52,
    decoration: BoxDecoration(
      color: fillwhiteColor == true
          ? HexColor("#FFFFFF")
          : errorText == true
              ? HexColor('#FCF3F2')
              : HexColor("#F5F5F5"),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    child: DropdownButtonFormField<String>(
      value: controller.text.isNotEmpty ? controller.text : null,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(
        color: HexColor("#1A284B").withOpacity(0.6),
        fontFamily: 'Source Sans 3',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      onChanged: (String? newValue) {
        controller.text = newValue ?? '';
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(
          color: HexColor("#1A284B").withOpacity(0.6),
          fontFamily: 'Source Sans 3',
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: const EdgeInsets.only(top: 16, left: 20),
      ),
      items: [
        DropdownMenuItem<String>(
          value: '100',
          child: Text('100 Level'),
        ),
        DropdownMenuItem<String>(
          value: '200',
          child: Text('200 Level'),
        ),
        DropdownMenuItem<String>(
          value: '300',
          child: Text('300 Level'),
        ),
        DropdownMenuItem<String>(
          value: '400',
          child: Text('400 Level'),
        ),
        DropdownMenuItem<String>(
          value: '500',
          child: Text('500 Level'),
        ),
      ],
    ),
  );
}
