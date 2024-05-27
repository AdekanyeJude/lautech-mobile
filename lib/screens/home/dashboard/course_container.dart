import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/utils/texts/poppins_text.dart';

Widget courseContainer(courseImage, professorprofileImg, professorName,
    courseCodeAndTitle, context) {
  return InkWell(
    onTap: () {
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => ChooseLevelScreen()));
    },
    child: Container(
      height: 260,
      width: 156,
      decoration: BoxDecoration(
        color: HexColor("#FFFFFF"),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.asset(
              courseImage,
              height: 116,
              width: 157,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 21,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(professorprofileImg))),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      width: 86,
                      child: poppinsText(
                        professorName,
                        16.0,
                        HexColor("#1A284B"),
                        fontWeight: FontWeight.w500,
                        align: TextAlign.start,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  courseCodeAndTitle,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: HexColor("#1A284B")),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
