import 'package:flutter/material.dart';

Widget opensansText(text, size, color, {align, fontWeight}) {
  return Text(
    text,
    textAlign: align ?? TextAlign.start,
    style: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: size,
      color: color,
      fontWeight: fontWeight ?? FontWeight.w400,
    ),
  );
}
