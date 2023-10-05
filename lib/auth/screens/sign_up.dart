import 'package:flutter/material.dart';
import 'package:my_app/auth/screens/widget/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child:  Scaffold(
      body: SignUpBody(formstate: GlobalKey(),),
    ),);
  }
}

