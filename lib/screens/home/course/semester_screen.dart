import 'package:flutter/material.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/utils/backnav_row.dart';

class SemesterCourseScreen extends StatefulWidget {
  const SemesterCourseScreen(
      {super.key, required this.semester, required this.level});
  final level, semester;

  @override
  State<SemesterCourseScreen> createState() => _SemesterCourseScreenState();
}

class _SemesterCourseScreenState extends State<SemesterCourseScreen> {
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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              children: [
                Column(
                  children: [
                    backNavRow(
                      context,
                      widget.semester,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
