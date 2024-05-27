import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/auth/forgotpassword/verify_otp_screen.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/textfield/name_textfield.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController phonenumController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/imgs/icon/back_arrow.png',
                          height: 18.76,
                          width: 13,
                        ),
                      ),
                      opensansText(
                        'Forgot Password',
                        23.0,
                        HexColor("#091031"),
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        width: 13,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Image.asset(
                    'assets/imgs/forgot-password-img.png',
                    height: 239,
                    width: 239,
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  textFieldUsername(
                    'Phone Number',
                    '',
                    false,
                    phonenumController,
                    keyboard: TextInputType.number,
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  textFieldUsername(
                    'Email',
                    '',
                    false,
                    emailController,
                    keyboard: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  authButton('Next', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyOtpScreen()));
                  })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
