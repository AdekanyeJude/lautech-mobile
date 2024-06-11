import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/home/assignment/assignment_screen.dart';
import 'package:lautech_mobile/utils/app_bar.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/successBottom_sheet.dart';
import 'package:lautech_mobile/utils/texts/poppins_text.dart';
import 'package:lautech_mobile/utils/texts/sourcesans_text.dart';

class AssignmentFileScreen extends StatefulWidget {
  const AssignmentFileScreen({super.key});

  @override
  State<AssignmentFileScreen> createState() => _AssignmentFileScreenState();
}

class _AssignmentFileScreenState extends State<AssignmentFileScreen> {
  var endTime = DateTime.now().millisecondsSinceEpoch + 1000000 * 30;

  bool timerActive = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: centerAlignedAppBar(context, 'Assignment'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 35,
                // width: 343,
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(color: HexColor("#905F32")),
                child: sourceSansText('Assignment File', 20.0, colorCodes.white,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 14,
              ),
              courseassignmentNameContainer('CSE202'),
              SizedBox(
                height: 4,
              ),
              InkWell(
                onTap: () {},
                child: poppinsText(
                    'Click the course above to download and view',
                    14.0,
                    HexColor("#905F32"),
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 14,
              ),
              SizedBox(
                  width: 350,
                  child: Divider(
                    color: colorCodes.black.withOpacity(0.3),
                  )),
              SizedBox(
                height: 11,
              ),
              poppinsText('Description:', 20.0, colorCodes.black,
                  fontWeight: FontWeight.w600),
              SizedBox(
                height: 3,
              ),
              poppinsText(
                  'Lorem ipsum dolor sit amet consectetur\nsequuntur voluptatum laborum\nnumquam blanditiis',
                  14.0,
                  colorCodes.black,
                  align: TextAlign.center),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  poppinsText('Time Left:', 20.0, colorCodes.black,
                      fontWeight: FontWeight.w600),
                  CountdownTimer(
                    endTime: endTime,
                    // widgetBuilder: (_, time) {
                    // if (time == null) {
                    //   return Center(
                    //     child: InkWell(
                    //       onTap: () {},
                    //       child: Text(
                    //         '',
                    //         style: TextStyle(
                    //           fontFamily: 'Poppins',
                    //           fontWeight: FontWeight.w700,
                    //           fontSize: 20,
                    //           color: colorCodes.black,
                    //         ),
                    //       ),
                    //     ),
                    //   );
                    // }
                    //   return Text(
                    //     ' ${time.sec}',
                    //     style: TextStyle(
                    //       fontFamily: 'Poppins',
                    //       fontWeight: FontWeight.w700,
                    //       fontSize: 20,
                    //       color: colorCodes.black,
                    //     ),
                    //   );
                    // },
                    textStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: colorCodes.black,
                    ),
                    onEnd: () {
                      setState(() {
                        timerActive = false;
                      });
                    },
                  ),
                  poppinsText('s', 20.0, colorCodes.black,
                      fontWeight: FontWeight.w600),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              SizedBox(
                  width: 350,
                  child: Divider(
                    color: colorCodes.black.withOpacity(0.3),
                  )),
              poppinsText(
                  'Submit within the stipulated time while the\nSubmit button is still available.',
                  12.0,
                  colorCodes.black,
                  align: TextAlign.center),
              SizedBox(
                height: 15,
              ),
              DottedBorder(
                strokeWidth: 2.0,
                child: Container(
                  width: 231,
                  height: 83,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: HexColor("#F5F5F5"),
                      borderRadius: BorderRadius.circular(5)),
                  child: poppinsText('Click to attach\nSubmission file', 16.0,
                      colorCodes.black.withOpacity(0.5),
                      fontWeight: FontWeight.w600, align: TextAlign.center),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              poppinsText(
                'Only pdf, doc, docx and txt are allowed',
                14.0,
                HexColor("#F41D1D").withOpacity(0.5),
                fontStyle: FontStyle.italic,
              ),
              SizedBox(
                height: 15,
              ),
              poppinsText(
                'You can only attach and submit once,\nmake sure you review your file\nbefore submission',
                14.0,
                colorCodes.black,
                align: TextAlign.center,
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                  decoration: BoxDecoration(color: HexColor("#FFFFFF")),
                  child: authButton(
                    'Submit',
                    () {
                      successBottomSheet(context, 'Submission was successful',
                          () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AssignmentsScreen()));
                      });
                    },
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget courseassignmentNameContainer(courseCode) {
    return Container(
      height: 32,
      width: 245,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: HexColor("#F5F5F5"),
      ),
      child: poppinsText('$courseCode assignment.docx', 14.0,
          colorCodes.black.withOpacity(0.5),
          fontWeight: FontWeight.w700),
    );
  }
}
