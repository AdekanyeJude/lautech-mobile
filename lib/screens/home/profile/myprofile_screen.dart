import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/auth/forgotpassword/forgot_password_screen.dart';
import 'package:lautech_mobile/screens/auth/login_screen.dart';
import 'package:lautech_mobile/screens/bottomNav/bottomnav_bar.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/textfield/name_textfield.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';
import 'package:lautech_mobile/utils/texts/poppins_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:lautech_mobile/api/model/userModel.dart';
import 'package:toastification/toastification.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  late UserDataLoginModel userData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userDataString = prefs.getString('userData');
    if (userDataString != null) {
      userData = UserDataLoginModel.fromJson(json.decode(userDataString));
      setState(() {
        firstnameController.text = userData.info.firstName;
        lastnameController.text = userData.info.lastName;
        password.text = userData.info.email;
        confirmpassword.text = userData.info.password;
      });
    }
  }

  // Future<void> _updateUserData() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   userData.info.firstName = firstnameController.text;
  //   userData.info.lastName = lastnameController.text;
  //   userData.info.password = confirmpassword.text;

  //   final String userDataString = json.encode(userData);
  //   await prefs.setString('userData', userDataString);
  // }

  Future<void> _logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userData');
    // Navigate to login screen or any other initial screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorCodes.white,
        surfaceTintColor: colorCodes.white,
        centerTitle: false,
        title: opensansText('My Profile', 20.0, HexColor("#1A284B"),
            fontWeight: FontWeight.w600),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
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
                textFieldUsername('First Name', '', false, firstnameController),
                const SizedBox(
                  height: 21,
                ),
                textFieldUsername(
                  'Last Name',
                  '',
                  false,
                  lastnameController,
                ),
                const SizedBox(
                  height: 21,
                ),
                // textFieldUsername('Password', '', false, password),
                // const SizedBox(
                //   height: 21,
                // ),
                // textFieldUsername(
                //   'Confirm Password',
                //   '',
                //   false,
                //   confirmpassword,
                // ),
                const SizedBox(
                  height: 52,
                ),
                authButton('Update', () async {
                  toastification.show(
                    context:
                        context, // optional if you use ToastificationWrapper
                    title: Text("No api found"),
                    autoCloseDuration: const Duration(seconds: 5),
                    backgroundColor: const Color.fromARGB(255, 244, 187, 54),
                    primaryColor: Colors.white,
                    foregroundColor: Colors.white,
                  );
                }),
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
