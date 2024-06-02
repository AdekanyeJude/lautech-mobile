import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/utils/texts/poppins_text.dart';

Widget authButton(text, function,
    {textColor, bacgroundColor, foregroundColor, textSize}) {
  return SizedBox(
    height: 56,
    width: 325,
    child: Container(
      foregroundDecoration: BoxDecoration(
          color: foregroundColor, borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              // disabledForegroundColor: foregroundColor,
              foregroundColor: foregroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: bacgroundColor ?? HexColor("#905F32"),
              padding: EdgeInsets.symmetric(horizontal: 10),
              elevation: 0.1),
          onPressed: function,
          child: poppinsText(
              text, textSize ?? 16.0, textColor ?? HexColor("#FFFFFF"),
              fontWeight: FontWeight.w600)),
    ),
  );
}
