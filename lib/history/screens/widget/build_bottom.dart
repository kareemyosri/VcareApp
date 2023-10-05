import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildBottom extends StatelessWidget {
  const BuildBottom({super.key, required this.price});
  final int price;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              padding:const EdgeInsets.symmetric(vertical: 20),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              backgroundColor:  const Color(0XFF174068),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: GoogleFonts.roboto().copyWith(
                      color: const Color(0xffFFFFFF),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500
                    )
                  ),
                   Text(
                    price.toString(),
                    style: GoogleFonts.roboto().copyWith(
                      color: const Color(0xffFFFFFF),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}