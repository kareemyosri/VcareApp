import 'package:flutter/material.dart';

abstract class AppConst {
  static const String baseUrl = 'https://vcare.integration25.com/api';
  static const String token = 'token';
  static const String savePassword = 'savePassword';
  static const String rigister = '/auth/register';
  static const String login = '/auth/login';

  static const String booking = '/appointment/store';
  static const String specialization = '/specialization/index';
  static const String getAllDoctor = '/doctor/index';
  static const String search = '/doctor/doctor-search?name=';
  static const String filter = '/doctor/doctor-filter?city=';
  static const String hostory = '/appointment/index';
  static const String profile = '/user/profile';
  //static const String lohout = '/auth/logout';
  // static const String booking = '/auth/logout';
  // /appointment/store

  static const String phoneAndEmailIsFailuer = 'email and phone  has already been taken.';
  static const String emailIsFailuer = 'The email has already been taken.';
  static const String phoneIsFailuer = 'The phone has already been taken.';
  static const String loginfailuer = "Credentials doesn`t match our records";
  static const String password= 'Password';
  static const Color baseColor= Color(0xff174068);
  static void showSnakbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$message')),
    );
  }
}
