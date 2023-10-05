import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/util/cubit/cubit/show_password_cubit.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    Key? key,
    required this.onChanged,
    this.inputType,
    this.index,
  }) : super(key: key);

  final Function(String) onChanged;
  final TextInputType? inputType;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowPasswordCubit, ShowPasswordState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 2.r),
          child: TextField(
            keyboardType: inputType ?? TextInputType.text,
            onChanged: onChanged,
            decoration: InputDecoration(
              
              contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
              hintText: 'Search',
              focusedBorder: const   OutlineInputBorder(
                borderSide: BorderSide.none,),
              border:const OutlineInputBorder(
                
                borderSide: BorderSide.none
              ),
              
              hintStyle:GoogleFonts.roboto().copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color:const Color.fromRGBO(3, 14, 25, 0.70),
              
              )
            ),
          ),
        );
      },
    );
  }
}


