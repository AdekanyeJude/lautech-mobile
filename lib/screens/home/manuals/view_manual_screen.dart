import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/home/manuals/make_pawment_screen.dart';
import 'package:lautech_mobile/screens/home/manuals/reading_manual_screen.dart';
import 'package:lautech_mobile/screens/home/manuals/semester_screen.dart';
import 'package:lautech_mobile/utils/app_bar.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';
import 'package:lautech_mobile/utils/texts/sourcesans_text.dart';

class ViewManualScreen extends StatefulWidget {
  const ViewManualScreen(
      {super.key,
      required this.level,
      required this.courseTitle,
      required this.courseCode,
      required this.dataSize,
      required this.manualStatus,
      required this.prieviousScreen});
  final level, courseTitle, courseCode, dataSize, manualStatus, prieviousScreen;

  @override
  State<ViewManualScreen> createState() => _ViewManualScreenState();
}

class _ViewManualScreenState extends State<ViewManualScreen> {
  @override
  Widget build(BuildContext context) {
    String courseprice = '#2500.00';
    return Scaffold(
        appBar: centerAlignedAppBar(context, 'View Manual',
            headerColor: HexColor("#1A284B"), popFunc: () {
          if (widget.prieviousScreen == 'PaymentProcessedScreen') {
            final route = MaterialPageRoute(
                builder: (context) => LevelManualScreen(level: '100'));
            Navigator.pushAndRemoveUntil(
                context, route, (route) => route.isFirst);
          } else {
            Navigator.pop(context);
          }
        }),
        backgroundColor: colorCodes.white,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            Column(children: [
              Row(
                children: [
                  Container(
                    height: 148,
                    width: 126,
                    decoration: BoxDecoration(
                        color: colorCodes.white,
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                            image: AssetImage("assets/imgs/courseImg.png"))),
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
                          courseCodeContainer('Unit: 3')
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
                widget.manualStatus == 'Get Manual'
                    ? 'Buy:  $courseprice'
                    : 'Open Manual',
                () {
                  if (widget.manualStatus == 'Get Manual') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MakePaymentScreen()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReadingManualScreen()));
                  }
                },
              ),
              SizedBox(
                height: 65,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: ListTile(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => AboutCourseScreen()));
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
        ));
  }
}

Widget courseCodeContainer(text, {width}) {
  return Container(
    height: 30,
    width: width ?? 72,
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
