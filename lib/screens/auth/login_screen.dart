import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/auth/signup_screen.dart';
import 'package:lautech_mobile/screens/home/dashboard/dashboard.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/button/forgotpass_btn.dart';
import 'package:lautech_mobile/utils/textfield/name_textfield.dart';
import 'package:lautech_mobile/utils/texts/poppins_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController matricNumberController = TextEditingController();
  TextEditingController passwrdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorCodes.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/imgs/background-image.png'),
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/imgs/Logo.png',
                      height: 72,
                      width: 77,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    poppinsText('Welcome', 14.0, HexColor("#1A284B"),
                        fontWeight: FontWeight.w600),
                    poppinsText(
                        'Sign in to continue!', 12.0, HexColor("#1A284B"),
                        fontWeight: FontWeight.w500),
                    const SizedBox(
                      height: 28,
                    ),
                    textFieldUsername(
                      'Matric Number',
                      '',
                      false,
                      matricNumberController,
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    textFieldUsername(
                      'Password',
                      '',
                      true,
                      passwrdController,
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: forgotPasswordButton(
                        'Forgot Password',
                        () {},
                      ),
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    authButton('LOGIN', () {
                      if (matricNumberController.text.isNotEmpty &&
                          passwrdController.text.isNotEmpty) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashBoard()));
                      }
                    }),
                    const SizedBox(
                      height: 40,
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: HexColor("#707070")),
                        children: [
                          TextSpan(text: 'Don’t have an account? '),
                          TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HexColor("#EB5757")),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignupScreen()));
                                }),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
