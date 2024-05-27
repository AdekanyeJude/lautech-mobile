import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/auth/forgotpassword/create_new_password.dart';
import 'package:lautech_mobile/utils/backnav_row.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  TextEditingController pinController = TextEditingController(text: "");
  String resendText = 'You can resend the code in  ';
  var endTime = DateTime.now().millisecondsSinceEpoch + 2000 * 30;

  bool istimerActive = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#FAF8F8"),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  backNavRow(
                    context,
                    'Forgot Password',
                    textSize: 23.0,
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  opensansText(
                      'We have sent the OTP verifcation code to\nyour email address. Check your email and\nenter the code below',
                      18.0,
                      HexColor("#091031"),
                      align: TextAlign.center),
                  SizedBox(
                    height: 33,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 256,
                      // height: 50,
                      child: PinCodeTextField(
                        length: 4,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        appContext: context,
                        showCursor: true,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        keyboardType: TextInputType.number,
                        enableActiveFill: true,
                        pinTheme: PinTheme(
                            activeFillColor: colorCodes.white,
                            selectedFillColor: colorCodes.white,
                            inactiveFillColor: colorCodes.white,
                            shape: PinCodeFieldShape.box,
                            fieldHeight: 54,
                            fieldWidth: 54,
                            borderWidth: 1.0,
                            fieldOuterPadding: const EdgeInsets.all(5),
                            selectedColor: colorCodes.black,
                            disabledColor: colorCodes.white,
                            activeColor: colorCodes.black,
                            inactiveColor: colorCodes.white,
                            borderRadius: BorderRadius.circular(15)),
                        onChanged: (value) {},
                        autoFocus: true,
                        // backgroundColor: colorCodes.white,
                        controller: pinController,
                        textStyle: TextStyle(
                            fontSize: 32.0,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            color: HexColor("#091031")),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  opensansText(
                    'Didn’t receive email?',
                    18.0,
                    HexColor("#091031"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      opensansText(
                        resendText,
                        18.0,
                        HexColor("#091031"),
                      ),
                      CountdownTimer(
                        endTime: endTime,
                        widgetBuilder: (_, time) {
                          if (time == null) {
                            // {
                            //   setState(() {
                            //     resendText = 'Resend code ';
                            //   });
                            // }

                            return Center(
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  'now',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: HexColor("#905F32"),
                                  ),
                                ),
                              ),
                            );
                          }
                          return Text(
                            ' ${time.sec}s',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: HexColor("#905F32"),
                            ),
                          );
                        },
                        onEnd: () {
                          setState(() {
                            resendText = 'Resend code ';
                            istimerActive = false;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 41,
                  ),
                  authButton('Continue', () {
                    if (pinController.text.isNotEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateNewPasswordScreen()));
                    }
                  })
                ],
              )
            ],
          ),
        ));
  }
}
