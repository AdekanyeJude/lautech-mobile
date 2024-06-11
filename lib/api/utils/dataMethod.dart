import 'dart:convert';

import 'package:lautech_mobile/api/controller/loginApi.dart';
import 'package:lautech_mobile/api/model/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> loadUserData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? userData = prefs.getString('userData');

  if (userData != null) {
    final Map<String, dynamic> jsonData = json.decode(userData);
    userDataLoginModelVar = UserDataLoginModel.fromJson(jsonData);
  } else {
    // Handle the case where userData is null
    userDataLoginModelVar = null;
  }
}
