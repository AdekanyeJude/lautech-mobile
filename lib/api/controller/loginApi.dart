import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lautech_mobile/api/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lautech_mobile/api/model/userModel.dart';

var userDataLoginModelVar;

class LoginApi extends ChangeNotifier {
  bool _loginSuccess = false;
  bool get loginSuccess => _loginSuccess;

  String _message = '';
  String get message => _message;

  loginApi(String email, String passwordData, BuildContext context) async {
    try {
      var result = await InternetAddress.lookup('google.com');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var body = {
          "email": email,
          "password": passwordData,
        };
        print(body);

        final response =
            await HttpService.loginPostRequest('/student/login', body);
        print("here1");
        final data = json.decode(response.body);
        print("here2");
        if (response.statusCode == 200) {
          print("Success");
          userDataLoginModelVar = UserDataLoginModel.fromJson(data);
          final SharedPreferences prefs = await SharedPreferences.getInstance();

          // Save user data to SharedPreferences
          prefs.setString('userData', json.encode(data));

          _loginSuccess = userDataLoginModelVar.success;
          _message = userDataLoginModelVar.message;
        } else {
          print("failed");

          _message = data['message'] ?? 'An error occurred';
          print(_message);
        }

        notifyListeners();
      } else {
        print('Check your Network');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
