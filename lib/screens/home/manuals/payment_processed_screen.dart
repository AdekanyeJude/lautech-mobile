import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/home/manuals/view_manual_screen.dart';
import 'package:lautech_mobile/utils/app_bar.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';

class PaymentProcessedScreen extends StatefulWidget {
  const PaymentProcessedScreen({super.key});

  @override
  State<PaymentProcessedScreen> createState() => _PaymentProcessedScreenState();
}

class _PaymentProcessedScreenState extends State<PaymentProcessedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: centerAlignedAppBar(context, 'Payment'),
      backgroundColor: colorCodes.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Align(
              alignment: Alignment.center,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/imgs/processed.png',
                      height: 215,
                      width: 215,
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    opensansText(
                      'Your Payment is being processed',
                      20.0,
                      HexColor("#091031"),
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: 180,
                    ),
                    authButton('Proceed', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewManualScreen(
                                    level: '100',
                                    courseTitle: 'courseTitle',
                                    courseCode: 'courseCode',
                                    dataSize: '10 MB',
                                    manualStatus: 'Downloaded',
                                    prieviousScreen: 'PaymentProcessedScreen',
                                  )));
                    })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
