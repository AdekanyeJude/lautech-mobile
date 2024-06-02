import 'package:flutter/material.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/texts/poppins_text.dart';

successBottomSheet(context, successtext, proceedFunc) {
  return showModalBottomSheet(
      context: context,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return Container(
          height: 342,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: colorCodes.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 9.2,
                    spreadRadius: 2,
                    color: colorCodes.black.withOpacity(0.25))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/imgs/success-standard.png',
                height: 170,
                width: 170,
              ),
              SizedBox(
                height: 25,
              ),
              poppinsText(
                successtext,
                20.0,
                colorCodes.black,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 30,
              ),
              authButton('Proceed', proceedFunc)
            ],
          ),
        );
      });
}
