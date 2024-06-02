import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/utils/texts/poppins_text.dart';

centerAlignedAppBar(context, header,
    {backgroundColor,
    shadowColor,
    fontSize,
    textSize,
    color,
    actions,
    headerColor,
    popFunc}) {
  return AppBar(
    // toolbarHeight: ,
    shadowColor: shadowColor,
    surfaceTintColor: colorCodes.white,
    backgroundColor: colorCodes.white,
    leading: InkWell(
      onTap: popFunc ??
          () {
            Navigator.pop(context);
          },
      child: Image.asset(
        'assets/imgs/icon/back_arrow.png',
        height: 17,
        width: 10,
        scale: 3.5,
      ),
    ),
    // leadingWidth: 45,
    // titleSpacing: 0.0,
    centerTitle: true,
    title: poppinsText(
      header,
      textSize ?? 20.0,
      headerColor ?? HexColor("#091031"),
      fontWeight: FontWeight.w600,
    ),
    actions: actions,
  );
}
