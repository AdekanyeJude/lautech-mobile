import 'package:flutter/material.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/home/course/level_container.dart';
import 'package:lautech_mobile/screens/home/course/semester_screen.dart';
import 'package:lautech_mobile/utils/backnav_row.dart';

class ChooseLevelScreen extends StatefulWidget {
  const ChooseLevelScreen({super.key});

  @override
  State<ChooseLevelScreen> createState() => _ChooseLevelScreenState();
}

class _ChooseLevelScreenState extends State<ChooseLevelScreen> {
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
                    'Choose your Level',
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  levelContainer(
                    'Level 1 (One)',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SemesterCourseScreen(
                                  semester: 'Rain Semester',
                                  level: 'Level 1 (One)',
                                )),
                      );
                    },
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SemesterCourseScreen(
                                  semester: 'Harmattan Semester',
                                  level: 'Level 1 (One)',
                                )),
                      );
                    },
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  levelContainer(
                    'Level 2(Two)',
                    () {},
                    () {},
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  levelContainer(
                    'Level 3 (Three)',
                    () {},
                    () {},
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  levelContainer(
                    'Level 4 (Four)',
                    () {},
                    () {},
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  levelContainer(
                    'Level 5 (Five)',
                    () {},
                    () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
