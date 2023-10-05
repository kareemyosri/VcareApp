import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInfo extends StatelessWidget {
  const TextInfo({super.key, required this.title, required this.subtitl, this.text});
  final String title;
  final String subtitl;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return      Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: Column(
                  children: [
                    Text(
                      // 'Lets get started!',
                      title,
                      style: GoogleFonts.roboto().copyWith(

                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                  subtitl,
                      style: GoogleFonts.roboto().copyWith(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),

                    text == null ? Container() :
                     Padding(
                      padding: EdgeInsets.only(top: 9.h),
                       child: Text(
                                       text!,
                        style: GoogleFonts.roboto().copyWith(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                                         ),
                     ),
                  ],
                ),
              );
  }
}