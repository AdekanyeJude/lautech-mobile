import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/home/quiz/quizzes_screen.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';

class QuizReportScreen extends StatefulWidget {
  const QuizReportScreen({super.key, required this.quizscore});
  final quizscore;

  @override
  State<QuizReportScreen> createState() => _QuizReportScreenState();
}

class _QuizReportScreenState extends State<QuizReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorCodes.white,
        surfaceTintColor: colorCodes.white,
        centerTitle: true,
        title: opensansText('Quiz Report', 20.0, HexColor("#1A284B"),
            fontWeight: FontWeight.w600),
      ),
      backgroundColor: colorCodes.white,
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        children: [
          Column(
            children: [
              Image.asset(
                'assets/imgs/folder-success.png',
                height: 200,
                width: 200,
              ),
              SizedBox(
                height: 51,
              ),
              opensansText('Report', 22.0, colorCodes.black,
                  fontWeight: FontWeight.w600),
              SizedBox(
                height: 5,
              ),
              opensansText(
                'Below is your quiz result.',
                16.0,
                colorCodes.black,
              ),
              SizedBox(
                height: 12,
              ),
              DottedBorder(
                  radius: Radius.circular(5),
                  child: Container(
                    height: 58,
                    width: 217,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: HexColor("#D9D9D9"),
                        borderRadius: BorderRadius.circular(5)),
                    child: opensansText(
                        widget.quizscore, 48.0, colorCodes.black,
                        fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: 45,
              ),
              authButton('Proceed', () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => QuizScreen()));
              })
            ],
          )
        ],
      ),
    );
  }
}
