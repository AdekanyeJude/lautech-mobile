import 'package:flutter/material.dart';

Widget poppinsText(text, size, color, {align, fontWeight}) {
  return Text(
    text,
    textAlign: align ?? TextAlign.start,
    style: TextStyle(
      fontFamily: 'Poppins',
      fontSize: size,
      color: color,
      fontWeight: fontWeight ?? FontWeight.w400,
    ),
  );
}
