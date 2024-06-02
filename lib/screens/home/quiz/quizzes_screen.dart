import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/bottomNav/bottomnav_bar.dart';
import 'package:lautech_mobile/screens/home/dashboard/searchtextfield_row.dart';
import 'package:lautech_mobile/screens/home/quiz/quiz_info_screen.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';
import 'package:lautech_mobile/utils/texts/sourcesans_text.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorCodes.white,
        surfaceTintColor: colorCodes.white,
        centerTitle: true,
        title: opensansText('', 20.0, HexColor("#1A284B"),
            fontWeight: FontWeight.w600),
      ),
      extendBody: true,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          Column(
            children: [
              searchtetField(
                'Filter Available Quiz',
                searchcontroller,
                () {},
                width: 357.0,
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                height: 35,
                // width: 343,
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(color: HexColor("#905F32")),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    sourceSansText('All Quiz', 20.0, colorCodes.white,
                        fontWeight: FontWeight.w600),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/imgs/sort-bold.png',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 300,
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return quizContainer(
                        'CSC 202 Quiz',
                        '-pending',
                        '67/100',
                        () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuizInfoScreen(
                                        quizCourseCode: 'CSC 101',
                                      )));
                        },
                      );
                    }),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget quizContainer(courseQuiz, quizStatus, quizScore, quizFunc) {
    return Column(
      children: [
        InkWell(
          onTap: quizFunc,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              sourceSansText(courseQuiz, 16.0, HexColor("#091031")),
              SizedBox(
                width: 68,
                child: sourceSansText(
                    quizStatus,
                    16.0,
                    quizStatus == '-Taken'
                        ? HexColor("#319103")
                        : HexColor("#FF4D00"),
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 50,
                child: sourceSansText(quizScore, 16.0, colorCodes.black),
              )
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: opensansText(
              '................................................................',
              18.0,
              HexColor("#B39981").withOpacity(0.7)),
        ),
      ],
    );
  }
}
