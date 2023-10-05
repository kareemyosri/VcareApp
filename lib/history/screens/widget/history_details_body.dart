import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/history/data/model/datum.dart';
import 'package:my_app/history/screens/widget/build_bottom.dart';

class HistoryDetailsBody extends StatelessWidget {
  const HistoryDetailsBody({super.key, required this.data});
  final Datum data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 14.h),

          _textInfo('Doctor details'),
          _customListTile('name', data.doctor!.name.toString()),
          SizedBox(height: 14.h),
          _customListTile(
              'location', data.doctor!.address.toString().substring(0, 16)),
          SizedBox(height: 14.h),

          _customListTile('email', data.doctor!.email.toString()),
          SizedBox(height: 14.h),
          _customListTile('phone', data.doctor!.phone.toString()),
          SizedBox(height: 7.h),
          _textInfo('Patient details'),
          _customListTile('name', data.patient!.name.toString()),
          SizedBox(height: 14.h),

          _customListTile('email', data.patient!.email.toString()),
          SizedBox(height: 14.h),

          _customListTile('phone', data.patient!.phone.toString()),
          SizedBox(height: 7.h),

          _textInfo('Appointment details'),
          _customListTile('data', data.appointmentTime!.toString()),
          SizedBox(height: 14.h),

          _customListTile('appointment id ', data.id!.toString()),
          SizedBox(height: 14.h),

          _customListTile('status', data.status.toString()),
          Expanded(
              child: SizedBox(
            height: 12.h,
          )),
          BuildBottom(
            price: data.appointmentPrice!,
          ),
          SizedBox(height: 14.h),
        ],
      ),
    );
  }

  Widget _textInfo(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Text(
        text,
        style: GoogleFonts.roboto().copyWith(
            color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _customListTile(String titl, String trailing) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titl,
          style: GoogleFonts.roboto().copyWith(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
        Text(
          trailing,
          style: GoogleFonts.roboto().copyWith(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
