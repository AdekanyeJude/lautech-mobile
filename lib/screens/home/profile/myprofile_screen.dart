import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/auth/forgotpassword/forgot_password_screen.dart';
import 'package:lautech_mobile/screens/bottomNav/bottomnav_bar.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/textfield/name_textfield.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';
import 'package:lautech_mobile/utils/texts/poppins_text.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController matricController = TextEditingController();
  TextEditingController phonenumController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorCodes.white,
        surfaceTintColor: colorCodes.white,
        centerTitle: true,
        title: opensansText('My Profile', 20.0, HexColor("#1A284B"),
            fontWeight: FontWeight.w600),
      ),
      backgroundColor: colorCodes.white,
      extendBody: true,
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/imgs/Logo.png',
                  height: 72,
                  width: 77,
                ),
                const SizedBox(
                  height: 11,
                ),
                poppinsText('Update Profile', 14.0, HexColor("#1A284B"),
                    fontWeight: FontWeight.w600),
                const SizedBox(
                  height: 36,
                ),
                textFieldUsername('Full Name', '', false, fullnameController),
                const SizedBox(
                  height: 21,
                ),
                textFieldUsername(
                  'Email Address',
                  '',
                  false,
                  emailController,
                  keyboard: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 21,
                ),
                textFieldUsername('Matric Number', '', false, matricController),
                const SizedBox(
                  height: 21,
                ),
                textFieldUsername(
                  'Phone Number',
                  '',
                  false,
                  phonenumController,
                  keyboard: TextInputType.number,
                ),
                const SizedBox(
                  height: 52,
                ),
                authButton('Update', () {}),
                const SizedBox(
                  height: 27,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: HexColor("#2E2E2E")),
                          children: [
                        TextSpan(text: 'Want to '),
                        TextSpan(
                            text: 'update password',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPasswordScreen()));
                              },
                            style: TextStyle(color: HexColor("#905F32"))),
                        TextSpan(text: '?')
                      ])),
                )
              ],
            )
          ]),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
