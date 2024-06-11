import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/home/quiz/quiz_report_screen.dart';
import 'package:lautech_mobile/screens/home/quiz/timerup_dialog.dart';
import 'package:lautech_mobile/utils/app_bar.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';
import 'package:lautech_mobile/utils/texts/sourcesans_text.dart';
import 'package:number_paginator/number_paginator.dart';

class AttemptingQuizScreen extends StatefulWidget {
  const AttemptingQuizScreen({super.key, required this.quizCoursecode});
  final quizCoursecode;

  @override
  State<AttemptingQuizScreen> createState() => _AttemptingQuizScreenState();
}

enum QuestionsOption { optionOne, optionTwo, optionThree, optionFour }

QuestionsOption? _option;

class _AttemptingQuizScreenState extends State<AttemptingQuizScreen> {
  var endTime = DateTime.now().millisecondsSinceEpoch + 900000;
  bool isChangePage = false;
  bool timerActive = true;
  int numberofPages = 10;
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    var pages = List.generate(
        numberofPages,
        (index) => Column(
              children: [
                opensansText('Question ${index + 1}.', 20.0, colorCodes.black,
                    fontWeight: FontWeight.w700),
                SizedBox(
                  height: 5,
                ),
                sourceSansText(
                    'This test comprise of your 50marks blablahblah  is a medium for recording information in the form of writing or images, typically composed of many pages bound together and protected by a cover. It ',
                    16.0,
                    colorCodes.black,
                    align: TextAlign.justify),
                SizedBox(
                  height: 25,
                ),
                optionListTile('Option 1', QuestionsOption.optionOne, (value) {
                  setState(() {
                    _option = value;
                  });
                }),
                optionListTile('Option 2', QuestionsOption.optionTwo, (value) {
                  setState(() {
                    _option = value;
                  });
                }),
                optionListTile('Option 3', QuestionsOption.optionThree,
                    (value) {
                  setState(() {
                    _option = value;
                  });
                }),
                optionListTile('Option 4', QuestionsOption.optionFour, (value) {
                  setState(() {
                    _option = value;
                  });
                }),
                SizedBox(
                  height: 93,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    opensansText('Time Remaining: ', 20.0, colorCodes.black),
                    TimerCountdown(
                      format: CountDownTimerFormat.minutesSeconds,
                      enableDescriptions: false,
                      endTime: DateTime.now().add(
                        const Duration(minutes: 00, seconds: 50),
                      ),
                      timeTextStyle: TextStyle(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: colorCodes.black,
                      ),
                      colonsTextStyle: TextStyle(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: colorCodes.black,
                      ),
                      onEnd: () {
                        setState(() {
                          timerActive = false;
                          showDialog(
                              context: context,
                              builder: (context) => timerUpDialog(() {}));
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 49,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 92,
                          height: 40,
                          child: authButton(
                            'Prev',
                            () {
                              setState(() {
                                isChangePage = true;
                                if (currentPage == 0) {
                                } else {
                                  currentPage = currentPage - 1;
                                }
                              });
                            },
                            foregroundColor: index == 0
                                ? HexColor("#D0CFCF").withOpacity(0.8)
                                : Colors.transparent,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        SizedBox(
                          width: 92,
                          height: 40,
                          child: authButton('Next', () {
                            setState(() {
                              if (currentPage == numberofPages - 1) {
                              } else {
                                isChangePage = true;
                                currentPage = currentPage + 1;
                                _option = null;
                              }
                            });
                          }),
                        ),
                      ],
                    ))
              ],
            ));
    var pagination = List.generate(
        10,
        (index) => Container(
            height: 30,
            width: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: _option != null
                    ? HexColor("#905F32")
                    : HexColor("#DFDEDE")),
            child: opensansText('${currentPage + 1}', 22.0,
                _option != null ? colorCodes.white : HexColor("#091031"),
                fontWeight: FontWeight.w600)));
    return Scaffold(
      appBar: centerAlignedAppBar(context, widget.quizCoursecode),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          Container(
            child: pages[currentPage],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [pagination[currentPage]],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          authButton('Submit', () {
            showDialog(context: context, builder: (context) => submitDialog());
          })
        ],
      ),
    );
  }

  Widget optionListTile(optiontext, optionValue, onchanged) {
    return ListTile(
      title: sourceSansText(optiontext, 16.0, colorCodes.black),
      leading: Radio(
        value: optionValue,
        groupValue: _option,
        onChanged: onchanged,
      ),
    );
  }

  Widget submitDialog() {
    return AlertDialog(
      titlePadding: const EdgeInsets.only(top: 16.0, left: 21.0, right: 21.0),
      alignment: Alignment.center,
      backgroundColor: colorCodes.white,
      surfaceTintColor: colorCodes.white,
      content: Text(
        'Are you sure\nyou want to submit?',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: colorCodes.black),
      ),
      actionsPadding:
          const EdgeInsets.symmetric(vertical: 20.0, horizontal: 21),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        SizedBox(
            width: 100,
            height: 40,
            child: authButton('Yes', () {
              setState(() {
                timerActive = false;
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          QuizReportScreen(quizscore: '67/100')));
            }, textSize: 14.0)),
        SizedBox(
            width: 120,
            height: 40,
            child: authButton('No, resume', () {
              Navigator.pop(context);
            },
                bacgroundColor: HexColor("#D6D6D6"),
                textColor: colorCodes.black,
                textSize: 14.0))
      ],
    );
  }
}
