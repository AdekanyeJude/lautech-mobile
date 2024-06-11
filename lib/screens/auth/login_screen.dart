import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/api/controller/loginApi.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/main.dart';
import 'package:lautech_mobile/screens/auth/signup_screen.dart';
import 'package:lautech_mobile/screens/home/dashboard/dashboard.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/button/forgotpass_btn.dart';
import 'package:lautech_mobile/utils/textfield/name_textfield.dart';
import 'package:lautech_mobile/utils/texts/poppins_text.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginApi>(context);

    return Scaffold(
      backgroundColor: colorCodes.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //   fit: BoxFit.fill,
          //   image: AssetImage('assets/imgs/background-image.png'),
          // )),
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
                      'Email',
                      '',
                      false,
                      emailController,
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    textFieldUsername(
                      'Password',
                      '',
                      true,
                      passwordController,
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: forgotPasswordButton(
                        'Forgot Password',
                        context,
                      ),
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    authButton('LOGIN', () {
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        if (emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          //api integration
                          print("here");
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

                          loginProvider
                              .loginApi(emailController.text,
                                  passwordController.text, context)
                              .then(
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
                        }
                      } else {
                        toastification.show(
                          context:
                              context, // optional if you use ToastificationWrapper
                          title: Text('Fill all required fields'),
                          autoCloseDuration: const Duration(seconds: 5),
                          backgroundColor: Colors.red,
                          primaryColor: Colors.white,
                          foregroundColor: Colors.white,
                        );
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
