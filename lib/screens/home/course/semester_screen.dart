import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/home/course/course_overview_screen.dart';
import 'package:lautech_mobile/utils/backnav_row.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';
import 'package:lautech_mobile/utils/texts/sourcesans_text.dart';

class SemesterCourseScreen extends StatefulWidget {
  const SemesterCourseScreen(
      {super.key, required this.semester, required this.level});
  final level, semester;

  @override
  State<SemesterCourseScreen> createState() => _SemesterCourseScreenState();
}

class _SemesterCourseScreenState extends State<SemesterCourseScreen> {
  get future => null;

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.symmetric(vertical: 30),
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: backNavRow(
                        context,
                        widget.semester,
                      ),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(color: HexColor("#905F32")),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          sourceSansText(
                            'Course code',
                            16.0,
                            colorCodes.white,
                            fontWeight: FontWeight.w600,
                          ),
                          sourceSansText(
                            'Course Title ',
                            16.0,
                            colorCodes.white,
                            fontWeight: FontWeight.w600,
                          ),
                          sourceSansText(
                            'Units',
                            16.0,
                            colorCodes.white,
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                    ),
                    FutureBuilder(
                        future: future,
                        builder: (context, snapshot) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              courseNameRow(
                                  'CSC 100', 'Fundamental of  Organic', '3'),
                            ],
                          );
                        })
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget courseNameRow(courseCode, coursetitle, courseUnit) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CourseOverviewScreen(
                          level: widget.level,
                          semester: widget.semester,
                          courseTitle: coursetitle,
                          courseCode: courseCode,
                          courseUnit: courseUnit,
                        )));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 60,
                  child: opensansText(
                    courseCode,
                    15.0,
                    HexColor("#091031"),
                  ),
                ),
                SizedBox(
                  width: 170,
                  child: opensansText(coursetitle, 15.0, HexColor("#091031"),
                      overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  width: 60,
                  child: opensansText(courseUnit, 15.0, HexColor("#091031"),
                      align: TextAlign.end),
                ),
              ],
            ),
          ),
        ),
        opensansText(
            '.....................................................................',
            18.0,
            HexColor("#B39981").withOpacity(0.7)),
      ],
    );
  }
}
