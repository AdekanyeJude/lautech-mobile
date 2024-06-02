import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/home/manuals/view_manual_screen.dart';
import 'package:lautech_mobile/screens/home/quiz/attempting_quiz_screen.dart';
import 'package:lautech_mobile/utils/app_bar.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';
import 'package:lautech_mobile/utils/texts/sourcesans_text.dart';

class QuizInfoScreen extends StatefulWidget {
  const QuizInfoScreen({super.key, required this.quizCourseCode});
  final quizCourseCode;

  @override
  State<QuizInfoScreen> createState() => _QuizInfoScreenState();
}

class _QuizInfoScreenState extends State<QuizInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: centerAlignedAppBar(context, 'Quiz'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          Column(
            children: [
              opensansText(
                'Fundamental of Organic',
                22.0,
                HexColor("#091031"),
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 32,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        courseCodeContainer(widget.quizCourseCode),
                        SizedBox(width: 117),
                        courseCodeContainer('Unit: 3')
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        courseCodeContainer('100 Questions', width: 131.0),
                        SizedBox(width: 56),
                        courseCodeContainer('Time: 15min', width: 131.0)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 59,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: opensansText(
                  'Quiz Info',
                  20.0,
                  HexColor("#091031"),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              sourceSansText(
                'This test comprise of your 50marks blablahblah  is a medium for recording information in the form of writing or images, typically composed of many pages bound together and protected by a cover. It ',
                16.0,
                colorCodes.black,
              ),
              SizedBox(
                height: 88,
              ),
              authButton('Start', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AttemptingQuizScreen(
                            quizCoursecode: widget.quizCourseCode)));
              })
            ],
          )
        ],
      ),
    );
  }
}
