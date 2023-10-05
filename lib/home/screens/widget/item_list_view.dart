import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/booking/screens/booking_screen.dart';
import 'package:my_app/util/app_const.dart';
import 'package:my_app/util/model/doctor.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({super.key, required this.doctor});
  final Doctors doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .45,

      margin: EdgeInsets.only(right: 8.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppConst.baseColor, width: 1),
        borderRadius: BorderRadius.circular(8),
        //   color: Colors.red
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            child: Image.network(
              doctor.photo.toString(),
              width: MediaQuery.of(context).size.width * 1.w,
              height: MediaQuery.of(context).size.height * .11.h,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6.h),
                Text(
                  doctor.name.toString(),
                  style: GoogleFonts.roboto().copyWith(
                      color: const Color(0xff030E19),
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp),
                      maxLines: 2,
                ),
                SizedBox(height: 12.h),
                Text(
                  doctor.description.toString(),
                  style: GoogleFonts.roboto().copyWith(
                    color: const Color(0xff9FA7AA),
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                  maxLines: 2,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Text(
                      'more details',
                      style: GoogleFonts.roboto().copyWith(
                          color: const Color(0xff030E19),
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp),
                    ),
                    SizedBox(width: 8.w),
                    InkWell(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(context,
                            screen: BookingScreen(
                              doctor: doctor,
                            ),
                            withNavBar:
                                false, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino);
                      },
                      child: FaIcon(
                        FontAwesomeIcons.arrowRightLong,
                        color: AppConst.baseColor.withOpacity(.9),
                        //size: 22,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
