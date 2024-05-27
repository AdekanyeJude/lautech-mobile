import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/home/course/course_overview_screen.dart';
import 'package:lautech_mobile/screens/home/dashboard/dashboard.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';

class PurchaseSuccessfulScreen extends StatefulWidget {
  const PurchaseSuccessfulScreen({super.key});

  @override
  State<PurchaseSuccessfulScreen> createState() =>
      _PurchaseSuccessfulScreenState();
}

class _PurchaseSuccessfulScreenState extends State<PurchaseSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorCodes.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/imgs/check.png',
                  height: 300,
                  width: 300,
                ),
                SizedBox(
                  height: 8,
                ),
                opensansText(
                    'You have successfully purchased\nIntroduction to Computer manual',
                    20.0,
                    HexColor("#EE0A0A"),
                    fontWeight: FontWeight.w600,
                    align: TextAlign.center),
                SizedBox(
                  height: 72,
                ),
                authButton(
                  'Open Manual',
                  () {
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => CourseOverviewScreen(
                    //               level: '',
                    //               semester: '',
                    //               courseTitle: '',
                    //               courseCode: '',
                    //               courseUnit: '',
                    //             )));
                  },
                ),
                SizedBox(
                  height: 29,
                ),
                authButton('Close', () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => DashBoard()));
                }, bacgroundColor: HexColor("#B39981"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
