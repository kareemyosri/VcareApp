import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/auth/manager/cubit/authrization_cubit.dart';
import 'package:my_app/auth/screens/widget/custom_check_box.dart';
import 'package:my_app/util/widget/text_info.dart';
import 'package:my_app/util/app_const.dart';
import 'package:my_app/util/cubit/cubit/show_password_cubit.dart';
import 'package:my_app/util/widget/custom_bottom.dart';
import 'package:my_app/util/widget/custom_text_form_filed.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key, required this.formstate});
  final GlobalKey<FormState> formstate;
  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController config_password = TextEditingController();
    final cubit = (BlocProvider.of<AuthrizationCubit>(context));
    return Form(
      key: formstate,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              

         const     TextInfo(title: 'Lets get started! ', subtitl: 'create an account and start booking now.'),
              CustomTextFormFiled(
                text: 'Name',
                onChanged: (String text) {
                  name.text = text;
                },
                validate: (String? name) {
                  if (name!.isEmpty) {
                    return 'The name field is required.';
                  } else if (name.length < 3 || name.length > 20) {
                    return 'The name must be at least 3 characters.';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 16.h),
              CustomTextFormFiled(
                text: 'Phone',
                onChanged: (String text) {
                  phone.text = text;
                },
                inputType: TextInputType.number,
                validate: (String? text) {
                  if (text!.isEmpty) {
                    return 'The Phone field is required.';
                  } else if (text.length != 11) {
                    return 'The Phone must be at least 11 numbers.';
                  } else if (cubit.erroMessag ==
                          AppConst.phoneAndEmailIsFailuer ||
                      cubit.erroMessag == AppConst.phoneIsFailuer) {
                    return 'The phone has already been taken.';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextFormFiled(
                text: 'Email',
                onChanged: (String text) {
                  email.text = text;
                },
                validate: (String? email) {
                  if (email!.isEmpty) {
                    return 'The email field is required.';
                  } else if (!email.contains('@')) {
                    return 'The email must be a valid email address.';
                  } else if (cubit.erroMessag ==
                          AppConst.phoneAndEmailIsFailuer ||
                      cubit.erroMessag == AppConst.emailIsFailuer) {
                    return 'The email has already been taken.';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextFormFiled(
                text: 'Password',
                index: 0,
                onChanged: (String text) {
                  password.text = text;
                },
                validate: (String? password) {
                  if (password!.isEmpty) {
                    return 'The Passwrd field is required';
                  } else if (password != config_password.text) {
                    return 'The password confirmation does not match.';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 16.h),
              CustomTextFormFiled(
                text: 'Password',
                index: 1,
                onChanged: (String text) {
                  config_password.text = text;
                },
                validate: (String? config_password) {
                  if (config_password!.isEmpty) {
                    return 'The Passwrd field is required';
                  } else if (password.text != config_password) {
                    return 'The password confirmation does not match.h';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomChckBox(
                    number: 0,
                    gender: 'Man',
                  ),
                  SizedBox(width: 12.w),
                  const CustomChckBox(
                    number: 1,
                    gender: 'Woman',
                  ),
                ],
              ),
              BlocConsumer<AuthrizationCubit, AuthrizationState>(
                builder: (context, state) {
                  if (state is StateIsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  } else {
                    return Custombottom(
                      text: 'Rigister',
                      ontap: () async {
                        if (formstate.currentState!.validate()) {
                          if (password.text == config_password.text) {
                            await BlocProvider.of<AuthrizationCubit>(context)
                                .signUp(queryParameters: {
                              "name": name.text,
                              "email": email.text,
                              "phone": phone.text,
                              "gender": cubit.gender.toString(),
                              "password": password.text,
                              "password_confirmation": config_password.text
                            });
                          } else {}
                        }
                      },
                    );
                  }
                },
                listener: (context, state) {
                  if (state is StateIsSuccessfuly) {
                    Navigator.pop(context);
                    AppConst.showSnakbar(context, 'SignUp is Successfuly');
                    BlocProvider.of<ShowPasswordCubit>(context).isShow[0] =
                        true;
                    BlocProvider.of<ShowPasswordCubit>(context).isShow[1] =
                        true;
                  } else if (state is StateIsFailuer) {
                    formstate.currentState!.validate();
                    cubit.erroMessag = null;
                  }
                },
              ),
           
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}



