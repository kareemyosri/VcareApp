import 'package:flutter/material.dart';
import 'package:my_app/all_doctor/screens/all_doctor_screen.dart';
import 'package:my_app/auth/screens/log_in_screen.dart';
import 'package:my_app/auth/screens/sign_up.dart';
import 'package:my_app/booking/screens/booking_screen.dart';
import 'package:my_app/booking/screens/booking_successfuly.dart';
import 'package:my_app/home/screens/home_screen.dart';
import 'package:my_app/search/screens/search_screen.dart';
import 'package:my_app/util/model/doctor.dart';

class AppRouter {
  static const String signUp = '/signUp';
  static const String homescreen = '/homescreen';
  static const String detailsscreen = '/detailsScreen';
  static const String loginScreen = '/loginscreen';
  static const String bookinissuccessfuly = '/BookinIsSuccessfuly';
  static const String alldoctor = '/alldoctor';
  static const String search = '/search';
  static const String editProfileScreen = "/EditProfileScreen";
  static const String onBoardingScreen = "/onBoardingScreen";
  static const String splashScreen = "/splashscreen";

//BookinIsSuccessfuly
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case homescreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case detailsscreen:
        final date = settings.arguments as Doctors;
        return MaterialPageRoute(
            builder: (_) => BookingScreen(
                  doctor: date,
                ));
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LogInScreen());
      case bookinissuccessfuly:
        return MaterialPageRoute(builder: (_) => const BookinIsSuccessfuly());
      case alldoctor:
        return MaterialPageRoute(builder: (_) => const AllDoctorScreen());
      case search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
    
   
    }
  }
}
