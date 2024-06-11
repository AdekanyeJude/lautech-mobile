import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/api/controller/loginApi.dart';
import 'package:lautech_mobile/api/controller/registerApi.dart';
import 'package:lautech_mobile/api/model/userModel.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/main.dart';
import 'package:lautech_mobile/screens/auth/forgotpassword/create_new_password.dart';
import 'package:lautech_mobile/screens/auth/signup_screen.dart';
import 'package:lautech_mobile/screens/home/dashboard/dashboard.dart';
import 'package:lautech_mobile/utils/backnav_row.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class VerifyOtpRegisterScreen extends StatefulWidget {
  const VerifyOtpRegisterScreen({super.key});

  @override
  State<VerifyOtpRegisterScreen> createState() =>
      _VerifyOtpRegisterScreenState();
}

class _VerifyOtpRegisterScreenState extends State<VerifyOtpRegisterScreen> {
  TextEditingController pinController = TextEditingController(text: "");
  String resendText = 'You can resend the code in  ';
  var endTime = DateTime.now().millisecondsSinceEpoch + 2000 * 30;

  bool istimerActive = true;
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginApi>(context);

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
                    'Verify Account',
                    textSize: 23.0,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  opensansText(
                      'We have sent the OTP verifcation code to\nyour email address. Check your email and\nenter the code below',
                      12.0,
                      HexColor("#091031"),
                      align: TextAlign.center),
                  SizedBox(
                    height: 35,
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
                    height: 41,
                  ),
                  authButton('Continue', () {
                    if (pinController.text.isNotEmpty) {
                      print(userDataRegisterModelVar.newUser.OTP);
                      print(pinController.text);
                      if (pinController.text ==
                          userDataRegisterModelVar.newUser.OTP.toString()) {
                        Loader.show(context,
                            isSafeAreaOverlay: true,
                            isBottomBarOverlay: true,
                            overlayFromBottom: 80,
                            overlayColor: Colors.black26,
                            progressIndicator: CircularProgressIndicator(
                                backgroundColor:
                                    Color.fromARGB(255, 253, 155, 8)),
                            themeData: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.fromSwatch()
                                    .copyWith(secondary: Colors.green)));

                        loginProvider.loginApi(email, password, context).then(
                          (_) {
                            // Handle the login result
                            if (loginProvider.loginSuccess) {
                              Loader.hide();
                              currentIndex = 1;
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashBoard()));
                            } else {
                              Loader.hide();
                              // Login failed
                              toastification.show(
                                context:
                                    context, // optional if you use ToastificationWrapper
                                title: Text(loginProvider.message),
                                autoCloseDuration: const Duration(seconds: 5),
                                backgroundColor: Colors.red,
                                primaryColor: Colors.white,
                                foregroundColor: Colors.white,
                              );
                            }
                          },
                        );
                      } else {
                        toastification.show(
                          context:
                              context, // optional if you use ToastificationWrapper
                          title: Text('Invalid OTP'),
                          autoCloseDuration: const Duration(seconds: 5),
                          backgroundColor: Colors.red,
                          primaryColor: Colors.white,
                          foregroundColor: Colors.white,
                        );
                      }
                    }
                  })
                ],
              )
            ],
          ),
        ));
  }
}
