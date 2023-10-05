import 'package:flutter/material.dart';
import 'package:my_app/auth/screens/widget/log_in_screen_body.dart';
class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Scaffold(
        body:LogInScreenBody(formstate: GlobalKey()),
      ),
    );
  }
}