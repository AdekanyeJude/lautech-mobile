import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/utils/texts/poppins_text.dart';

Widget backNavRow(context, text, {textSize, trailingWidget}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.asset(
          'assets/imgs/icon/back_arrow.png',
          height: 18.76,
          width: 13,
        ),
      ),
      poppinsText(
        text,
        textSize ?? 16.0,
        HexColor("#1A284B"),
        fontWeight: FontWeight.w600,
      ),
      trailingWidget ??
          SizedBox(
            width: 13,
          ),
    ],
  );
}
