import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/auth/login_screen.dart';
import 'package:lautech_mobile/utils/backnav_row.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/textfield/name_textfield.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  TextEditingController passwrdController = TextEditingController();

  TextEditingController confirmpasswrdController = TextEditingController();
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  backNavRow(
                    context,
                    'Create New Password',
                    textSize: 23.0,
                  ),
                  SizedBox(
                    height: 330,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      textFieldUsername(
                        'Password',
                        '',
                        true,
                        passwrdController,
                        fillwhiteColor: true,
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      textFieldUsername(
                        'Comfirm Password',
                        '',
                        true,
                        confirmpasswrdController,
                        fillwhiteColor: true,
                      ),
                      SizedBox(
                        height: 72,
                      ),
                      authButton('Continue', () {
                        if (passwrdController.text.isNotEmpty &&
                            confirmpasswrdController.text.isNotEmpty) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        }
                      })
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
