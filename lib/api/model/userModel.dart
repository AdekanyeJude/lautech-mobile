import 'dart:convert';
import 'package:flutter/material.dart';

var UserDataRegisterModelVar =
    UserDataRegisterModel.fromJson(json as Map<String, dynamic>);

class UserDataRegisterModel {
  var success;
  var message;
  var info;
  var newUser;

  UserDataRegisterModel({
    required this.success,
    required this.message,
    required this.info,
    required this.newUser,
  });

  factory UserDataRegisterModel.fromJson(Map<String, dynamic> json) {
    return UserDataRegisterModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      info: json['info'],
      newUser: json['newUser'],
    );
  }
}

// class Data {
//   String? email;
//   String? firstName;
//   String? lastName;
//   String? password;
//   int? id;
//   int? tokenNumber;

//   Data({
//     required this.email,
//     required this.firstName,
//     required this.lastName,
//     required this.password,
//     required this.id,
//     required this.tokenNumber,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) {
//     return Data(
//       // profileId: json['profileId'],
//       email: json['email'],
//       firstName: json['firstName'],
//       lastName: json['lastName'],
//       password: json['password'],
//       id: json['id'],
//       tokenNumber: json['tokenNumber'],
//     );
//   }
// }

// class RegisterApiResponse {
//   final Map<String, dynamic> data;
//   final bool isSuccessful;
//   final String message;

//   RegisterApiResponse({
//     required this.data,
//     required this.isSuccessful,
//     required this.message,
//   });

//   factory RegisterApiResponse.fromJson(Map<String, dynamic> json) {
//     return RegisterApiResponse(
//       data: json['data'],
//       isSuccessful: json['isSuccessful'],
//       message: json['message'],
//     );
//   }
// }

// this is for when the user doesn't have a profile picture.
var defaultDP =
    "https://lodlc.lautech.edu.ng/portal/static/media/avatar-img.634de00e53eb7bd58dde.jpg";
