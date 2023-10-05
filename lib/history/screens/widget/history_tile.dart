import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/history/data/model/datum.dart';
import 'package:my_app/history/screens/history_details.dart';
import 'package:my_app/util/app_const.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({
    super.key,
    required this.data,
  });
  final Datum data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: HistoryDetails(data: data),
                withNavBar: false, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(data.doctor!.photo.toString()),
              radius: 20.w,
            ),
            title: Text(
              data.doctor!.name.toString(),
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 15.5.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              data.appointmentTime.toString(),
              style: GoogleFonts.roboto(
                color: Colors.grey,
                fontSize: 13.5.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Text(
              data.appointmentPrice.toString(),
              style: GoogleFonts.roboto(
                color: AppConst.baseColor,
                fontSize: 15.5.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Divider(
            color: Colors.grey.shade400,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
