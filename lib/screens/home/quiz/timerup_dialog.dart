import 'package:flutter/material.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';

Widget timerUpDialog(timerupFunc) {
  return AlertDialog(
    titlePadding: const EdgeInsets.only(top: 16.0, left: 21.0, right: 21.0),
    alignment: Alignment.center,
    backgroundColor: colorCodes.white,
    surfaceTintColor: colorCodes.white,
  
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/imgs/timer.png',
          height: 100,
          width: 100,
        ),
        SizedBox(
          width: 20,
        ),
        SizedBox(
          height: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              opensansText('Time up!', 20.0, colorCodes.black,
                  fontWeight: FontWeight.w700),
              SizedBox(
                height: 2,
              ),
              opensansText(
                  'Your Quiz has\nbeen submitted', 16.0, colorCodes.black,
                  fontWeight: FontWeight.w600),
              SizedBox(
                height: 6,
              ),
              SizedBox(
                width: 134,
                height: 39,
                child: authButton('Proceed', timerupFunc),
              )
            ],
          ),
        ),
      ],
    ),
    actionsPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 21),
    actionsAlignment: MainAxisAlignment.center,
  );
}
