import 'dart:convert';
import 'package:flutter/material.dart';

// var userDataRegisterModelVar =
//     UserDataRegisterModel.fromJson(json as Map<String, dynamic>);
// var userDataLoginModelVar =
//     UserDataRegisterModel.fromJson(json as Map<String, dynamic>);

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
      newUser: UserInfo.fromJson(json['newUser']),
    );
  }
}

class UserDataLoginModel {
  var success;
  var message;
  Info info;

  UserDataLoginModel({
    required this.success,
    required this.message,
    required this.info,
  });

  factory UserDataLoginModel.fromJson(Map<String, dynamic> json) {
    return UserDataLoginModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      info: Info.fromJson(json['info']),
    );
  }

  Object? toJson() {}
}

class Info {
  var student;
  var id;
  var firstName;
  var lastName;
  var token;
  var tokenNumber;
  var coursesID;
  var ID;
  var password;
  var email;
  var courses;
  var verified;
  var createdAt;
  var admin;
  var v;

  Info({
    required this.student,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.token,
    required this.tokenNumber,
    required this.coursesID,
    required this.ID,
    required this.password,
    required this.email,
    required this.courses,
    required this.verified,
    required this.createdAt,
    required this.admin,
    required this.v,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      student: json['student'] ?? false,
      id: json['_id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      token: json['token'] ?? '',
      tokenNumber: json['tokenNumber'] ?? 0,
      coursesID: json['coursesID'] ?? [],
      ID: json['ID'] ?? 0,
      password: json['password'] ?? '',
      email: json['email'] ?? '',
      courses: json['courses'] ?? [],
      verified: json['verified'] ?? false,
      createdAt: json['created_at'] ?? '',
      admin: json['admin'] ?? false,
      v: json['__v'] ?? 0,
    );
  }
}

class UserInfo {
  late String email;
  late String firstName;
  late String lastName;
  late String password;
  late int level;
  late String department;
  late int phoneNumber;
  late String createdAt;
  late int ID;
  late String token;
  late int OTP;

  UserInfo({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.level,
    required this.department,
    required this.phoneNumber,
    required this.createdAt,
    required this.ID,
    required this.token,
    required this.OTP,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      password: json['password'],
      level: json['level'],
      department: json['department'],
      phoneNumber: json['phoneNumber'],
      createdAt: json['created_at'],
      ID: json['ID'],
      token: json['token'],
      OTP: json['OTP'],
    );
  }
}

// this is for when the user doesn't have a profile picture.
var defaultDP =
    "https://lodlc.lautech.edu.ng/portal/static/media/avatar-img.634de00e53eb7bd58dde.jpg";
