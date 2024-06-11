import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lautech_mobile/api/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lautech_mobile/api/model/userModel.dart';

class RegisterApi extends ChangeNotifier {
  bool _registrationSuccess = false;
  bool get registrationSuccess => _registrationSuccess;

  String _message = '';
  String get message => _message;

  registerApi(firstName, lastName, email, String passwordData, department,
      level, phoneNumber, matric, BuildContext context) async {
    try {
      var result = await InternetAddress.lookup('google.com');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var body = {
          "firstName": firstName,
          "lastName": lastName,
          "level": int.parse(level),
          "matricNumber": matric,
          "department": department,
          "password": passwordData,
          "email": email,
          "phoneNumber": int.parse(phoneNumber)
        };
        print(body);

        final response =
            await HttpService.registerPostRequest('/student/register', body);
        print("here1");
        final data = json.decode(response.body);
        print("here2");
        if (response.statusCode == 200) {
          print("Success");
          final registerApiResponse = UserDataRegisterModel.fromJson(data);
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          _registrationSuccess = registerApiResponse.success;
          _message = registerApiResponse.message;
        } else {
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
