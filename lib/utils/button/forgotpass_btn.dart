import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/utils/texts/poppins_text.dart';

Widget forgotPasswordButton(text, function, {textColor, bacgroundColor}) {
  return SizedBox(
    height: 30,
    width: 151,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            backgroundColor:
                bacgroundColor ?? HexColor("#B39981").withOpacity(0.3),
            elevation: 0.1),
        onPressed: function,
        child: poppinsText(text, 12.0, textColor ?? HexColor("#B39981"),
            fontWeight: FontWeight.w500)),
  );
}
