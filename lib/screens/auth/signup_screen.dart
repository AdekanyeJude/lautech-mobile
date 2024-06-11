import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/api/controller/registerApi.dart';
import 'package:lautech_mobile/api/utils/loading.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/auth/login_screen.dart';
import 'package:lautech_mobile/screens/home/dashboard/dashboard.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/textfield/name_textfield.dart';
import 'package:lautech_mobile/utils/texts/poppins_text.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController middlenameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController matricController = TextEditingController();
  TextEditingController phonenumController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController level = TextEditingController();
  String emailValidationtext = '';

  bool validateEmailBool(String email) {
    // Regular expression pattern for email validation
    const pattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  void validateEmail() {
    String emailValidator = emailController.text;
    bool isValid = validateEmailBool(emailValidator);
    if (emailController.text.isNotEmpty) {
      if (isValid || emailValidator == '') {
        // Email is valid
        // Perform any desired action
        setState(() {
          emailValidationtext = '';
        });
      } else {
        // Email is invalid
        // Display an error message or handle accordingly
        setState(() {
          emailValidationtext = 'Please insert a valid email';
        });
      }
    } else if (emailController.text.isEmpty) {
      setState(() {
        emailValidationtext = '';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(validateEmail);
  }

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterApi>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorCodes.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: LoaderOverlay(
          useDefaultLoading: false,
          overlayWidgetBuilder: (_) {
            //ignored progress for the moment
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          },
          child: Container(
            // decoration: const BoxDecoration(
            //     image: DecorationImage(
            //   image: AssetImage('assets/imgs/background-image.png'),
            // )),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                        height: 20,
                      ),
                      poppinsText('Create Account', 14.0, HexColor("#1A284B"),
                          fontWeight: FontWeight.w600),
                      const SizedBox(
                        height: 21,
                      ),
                      textFieldUsername(
                          'First Name', '', false, firstnameController),
                      const SizedBox(
                        height: 21,
                      ),
                      textFieldUsername(
                          'Last Name', '', false, lastnameController),
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
                      textFieldUsername(
                          'Matric Number', '', false, matricController),
                      const SizedBox(
                        height: 21,
                      ),
                      textFieldUsername(
                          'Department', '', false, departmentController),
                      const SizedBox(
                        height: 21,
                      ),
                      textFieldUsername('Level', '', false, level),
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
                        height: 21,
                      ),
                      textFieldUsername(
                          'Password', '', true, passwordController),
                      const SizedBox(
                        height: 21,
                      ),
                      textFieldUsername('Confirm Password', '', true,
                          confirmPasswordController),
                      const SizedBox(
                        height: 30,
                      ),
                      authButton('SIGN UP', () {
                        if (firstnameController.text.isNotEmpty &&
                            lastnameController.text.isNotEmpty &&
                            confirmPasswordController.text.isNotEmpty &&
                            matricController.text.isNotEmpty &&
                            phonenumController.text.isNotEmpty &&
                            emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          //api integration
                          print("here");

                          registerProvider
                              .registerApi(
                                  firstnameController.text,
                                  lastnameController.text,
                                  emailController.text,
                                  confirmPasswordController.text,
                                  departmentController.text,
                                  level.text,
                                  phonenumController.text,
                                  matricController.text,
                                  context)
                              .then(
                            (_) {
                              // Handle the login result
                              if (registerProvider.registrationSuccess) {
                                showDialog(
                                    context: context,
                                    builder: (context) => signupSuccessDialog(
                                        registerProvider.message,
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DashBoard()))));
                              } else {
                                // Login failed
                                setState(() {
                                  emailValidationtext =
                                      registerProvider.message;
                                });
                                // showToast(verifyEmailApi.message, colorCodes.paleRed, context);
                              }
                            },
                          );
                        }
                      }),
                      const SizedBox(
                        height: 13,
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: HexColor("#707070")),
                          children: [
                            TextSpan(text: 'Already have an account? '),
                            TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: HexColor("#EB5757")),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  }),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget signupSuccessDialog(successText, successFunc) {
  return AlertDialog(
    titlePadding: const EdgeInsets.only(top: 16.0, left: 21.0, right: 21.0),
    alignment: Alignment.center,
    title: Image.asset(
      'assets/imgs/like-img.png',
      height: 216,
      width: 215,
    ),
    contentPadding:
        const EdgeInsets.only(top: 10.0, bottom: 16.0, left: 21.0, right: 21.0),
    content: Text(
      successText,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: HexColor("#091031")),
    ),
    actionsPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 21),
    actionsAlignment: MainAxisAlignment.center,
    actions: [authButton('Continue', successFunc)],
  );
}
