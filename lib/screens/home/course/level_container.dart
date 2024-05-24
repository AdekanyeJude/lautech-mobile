import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';
import 'package:lautech_mobile/utils/texts/sourcesans_text.dart';

Widget levelContainer(leveltext, rainFunc, harmattanFunc) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 35,
        width: 343,
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(color: HexColor("#905F32")),
        child: sourceSansText(leveltext, 20.0, colorCodes.white,
            fontWeight: FontWeight.w600),
      ),
      SizedBox(
        height: 7,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 18,
              child: InkWell(
                onTap: rainFunc,
                child:
                    sourceSansText('Rain Semester', 16.0, HexColor("#091031")),
              ),
            ),
            opensansText(
                '.......................................................',
                18.0,
                HexColor("#B39981").withOpacity(0.7)),
            InkWell(
              onTap: harmattanFunc,
              child: sourceSansText(
                  'Harmattan Semester', 16.0, HexColor("#091031")),
            )
          ],
        ),
      )
    ],
  );
}
