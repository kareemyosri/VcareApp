import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/util/app_const.dart';
import 'package:my_app/util/cubit/cubit/show_password_cubit.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.text,
    required this.onChanged,
    required this.validate,
    this.inputType,
    this.index,
  });
   final String text;
  final Function(String) onChanged;
  final String? Function(String?) validate;

  final TextInputType? inputType;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowPasswordCubit, ShowPasswordState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 2.r),
          child: TextFormField(
            obscureText: text == AppConst.password
                ? BlocProvider.of<ShowPasswordCubit>(context).isShow[index!]
                : false,
            keyboardType: inputType ?? TextInputType.text,
            validator: validate,
            onChanged: onChanged,
            decoration: InputDecoration(
              label: Text(
                text,
                style: GoogleFonts.roboto()
                    .copyWith(fontSize: 16, color: const Color(0xff091E4A)),
              ),
              suffixIcon: text == AppConst.password
                  ? IconButton(
                      onPressed: () {
                     
                      BlocProvider.of<ShowPasswordCubit>(context)
                                .showPassword(index!);
                      
                      },
                      icon: Icon(BlocProvider.of<ShowPasswordCubit>(context)
                              .isShow[index!]
                          ? Icons.visibility_off
                          : Icons.visibility),
                      iconSize: 24,
                      color: Colors.black54,
                      // color: const Color(0xff01BE84),
                    )
                  : null,
              focusedBorder: const OutlineInputBorder(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.green, // يمكنك تغيير هذا اللون إلى لون "jhu"
                ),
              ),
              hintStyle: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        );
      },
    );
  }
}
