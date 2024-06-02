import 'package:flutter/material.dart';

Widget poppinsText(text, size, color, {align, fontWeight,fontStyle}) {
  return Text(
    text,
    textAlign: align ?? TextAlign.start,
    style: TextStyle(
      fontFamily: 'Poppins',
      fontSize: size,
      color: color,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontStyle:fontStyle?? FontStyle.normal
    ),
  );
}
