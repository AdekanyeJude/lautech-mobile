import 'package:flutter/material.dart';

Widget opensansText(text, size, color, {align, fontWeight, overflow}) {
  return Text(
    text,
    textAlign: align ?? TextAlign.start,
    style: TextStyle(
      overflow: overflow,
      fontFamily: 'Open Sans',
      fontSize: size,
      color: color,
      fontWeight: fontWeight ?? FontWeight.w400,
    ),
  );
}
