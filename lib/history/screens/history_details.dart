import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/history/data/model/datum.dart';
import 'package:my_app/history/screens/widget/history_details_body.dart';
import 'package:my_app/util/app_const.dart';

class HistoryDetails extends StatelessWidget {
  const HistoryDetails({super.key, required this.data});
  final Datum data;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppConst.baseColor,
          title: Text(
        'Detection details',
        style: GoogleFonts.roboto().copyWith(
            color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500),
      ), 
        ),
        body: HistoryDetailsBody(data: data,),
      ),
    );
  }
}
