import 'package:flutter/material.dart';

Widget sourceSansText(text, size, color, {align, fontWeight}) {
  return Text(
    text,
    textAlign: align ?? TextAlign.start,
    style: TextStyle(
      fontFamily: 'Source Sans 3',
      fontSize: size,
      color: color,
      fontWeight: fontWeight ?? FontWeight.w400,
    ),
  );
}
