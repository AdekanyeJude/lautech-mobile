import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/home/course/about_course_screen.dart';
import 'package:lautech_mobile/screens/home/course/select_payment_method_screen.dart';
import 'package:lautech_mobile/utils/backnav_row.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';
import 'package:lautech_mobile/utils/texts/sourcesans_text.dart';

class CourseOverviewScreen extends StatefulWidget {
  const CourseOverviewScreen(
      {super.key,
      required this.level,
      required this.semester,
      required this.courseTitle,
      required this.courseCode,
      required this.courseUnit});
  final level, semester, courseTitle, courseCode, courseUnit;

  @override
  State<CourseOverviewScreen> createState() => _CourseOverviewScreenState();
}

class _CourseOverviewScreenState extends State<CourseOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    String courseprice = '#2500.00';
    return Scaffold(
        backgroundColor: colorCodes.white,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/imgs/background-image.png'),
          )),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              children: [
                Column(children: [
                  backNavRow(
                    context,
                    widget.semester,
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 148,
                        width: 126,
                        decoration: BoxDecoration(
                            color: colorCodes.white,
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/imgs/courseImg.png"))),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 168,
                            child: opensansText(
                              widget.courseTitle,
                              22.0,
                              HexColor("#091031"),
                              align: TextAlign.start,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          opensansText(
                            'Prof. Wale Oke',
                            16.0,
                            HexColor("#091031"),
                            align: TextAlign.start,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Row(
                            children: [
                              courseCodeContainer(widget.courseCode),
                              SizedBox(width: 25),
                              courseCodeContainer('Unit: ${widget.courseUnit}')
                            ],
                          ),
                           SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              courseCodeContainer('80 PGs'),
                              SizedBox(width: 25),
                              courseCodeContainer('10 MB')
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 89,
                  ),
                  authButton(
                    'Buy:  $courseprice',
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectPaymentMethodScreen(
                                  courseTitle: widget.courseTitle,
                                  courseCode: widget.courseCode,
                                  courseUnit: widget.courseUnit)));
                    },
                  ),
                  SizedBox(
                    height: 65,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutCourseScreen()));
                      },
                      title: sourceSansText(
                        'About this Book ',
                        20.0,
                        HexColor("#091031"),
                        fontWeight: FontWeight.w600,
                      ),
                      trailing: Image.asset(
                        'assets/imgs/icon/arrow-forwrd.png',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                  sourceSansText(
                      "A book is a medium for recording information in the\nform of writing or images,typically composed of \nmany pages bound together and protected by a \ncover. It can also be a handwritten or printed work \nof fiction or nonfiction, usually on sheets of paper \nfastened or bound together within covers ...",
                      16.0,
                      colorCodes.black,
                      fontWeight: FontWeight.w300,
                      align: TextAlign.start),
                ])
              ],
            ),
          ),
        ));
  }
}

Widget courseCodeContainer(text) {
  return Container(
    height: 30,
    width: 72,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: HexColor("#B39981"),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(15))),
    child:
        opensansText(text, 16.0, colorCodes.white, fontWeight: FontWeight.w600),
  );
}
