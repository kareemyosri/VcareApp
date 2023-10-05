import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/booking/manager/cubit/booking_cubit.dart';

class ChoseTimeWidgt extends StatelessWidget {
  const ChoseTimeWidgt({super.key, required this.time, required this.index});
  final String time;
  final int index;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BookingCubit>(context);
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          margin: EdgeInsets.symmetric(horizontal: 6.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: cubit.isChose[index] == true
                  ? const Color(0xff174068)
                  : const Color(0xffDBE2E3)
              //   color: const Color(0xff174068)
              ),
          child: Center(
            child: Text(
              time,
              style: GoogleFonts.roboto().copyWith(
                  //color: Colors.white,
                  color: cubit.isChose[index] == true
                  ?  Colors.white
                  : Colors.grey.shade600,
              //    color: Colors.grey.shade600,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
        );
      },
    );
  }
}
