import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/manager/cubit/authrization_cubit.dart';
import 'package:my_app/auth/screens/widget/custom_check_box.dart';
import 'package:my_app/shared/my_shared.dart';
import 'package:my_app/util/app_const.dart';
import 'package:my_app/util/app_router.dart';
import 'package:my_app/util/widget/custom_bottom.dart';
import 'package:my_app/util/widget/custom_text_form_filed.dart';
import 'package:my_app/util/widget/text_info.dart';

class LogInScreenBody extends StatelessWidget {
  const LogInScreenBody({super.key, required this.formstate});
  final GlobalKey<FormState> formstate;
  @override
  Widget build(BuildContext context) {
    String? email;
    String? password;
    final cubit = BlocProvider.of<AuthrizationCubit>(context);
    return SingleChildScrollView(
      child: Form(
        key: formstate,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TextInfo(
                title: 'Welcome Back!',
                subtitl: 'Login to access your assigned tasks',
                text: 'and personal overview.',
              ),
              CustomTextFormFiled(
                text: 'Email',
                onChanged: (String text) {
                  email = text;
                },
                validate: (String? email) {
                  if (email!.isEmpty) {
                    return 'The email field is required.';
                  } else if (!email.contains('@')) {
                    return 'The email must be a valid email address.';
                  } else if ("Credentials doesn`t match our records" ==
                      cubit.erroMessag) {
                    return 'Credentials doesn`t match our records';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 14.h),
              CustomTextFormFiled(
                text: AppConst.password,
                index: 2,
                onChanged: (String text) {
                  password = text;
                },
                validate: (String? password) {
                  if (password!.isEmpty) {
                    return 'The password field is required.';
                  } else if ("Credentials doesn`t match our records" ==
                      cubit.erroMessag) {
                    return 'Credentials doesn`t match our records';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  const CustomChckBox(number: 2),
                  Text(
                    'Keep me logged in',
                    style: GoogleFonts.roboto().copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  )
                ],
              ),
              SizedBox(height: 8.h),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.signUp);
                },
                child: Text(
                  'No account yet? Register here.',
                  style: GoogleFonts.roboto().copyWith(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ),
              SizedBox(height: 22.h),
              BlocConsumer<AuthrizationCubit, AuthrizationState>(
                listener: (context, state) {
                  if (state is LoginIsSuccessfuly) {
                    MySharedPrefrence.setData(
                        key: AppConst.token,
                        value: state.userModel.data!.token);
                    Navigator.pushReplacementNamed(
                        context, AppRouter.homescreen);
                    AppConst.showSnakbar(context, 'Logged is Successfuly');
                    MySharedPrefrence.setData(key: AppConst.savePassword, value: cubit.isMain[2]);
                   
                  } else if (state is LoginIsFailuer) {
                    formstate.currentState!.validate();
                    cubit.erroMessag = null;
                  }
                },
                builder: (context, state) {
                  if (state is LoginIsLoadin) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.black),
                    );
                  } else if (state is LoginIsFailuer) {}
                  return Custombottom(
                      text: 'LOGIN',
                      ontap: () async {
                        if (formstate.currentState!.validate()) {
                          await cubit.login(
                            queryParameters: {
                              "email": email,
                              "password": password
                            },
                          );
                        }
                      });
                },
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}
