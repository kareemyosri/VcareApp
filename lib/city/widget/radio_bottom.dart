import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/util/app_const.dart';
import 'package:my_app/util/them.dart';

class RadioTile extends StatelessWidget {
    const RadioTile({Key? key, required this.cityName, required this.value,required this.groupValue, this.onChanged}) : super(key: key);
  final String cityName;
  final int value;
   final int groupValue;
    final void Function(int?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

            value: value, groupValue: groupValue, onChanged:onChanged),
        Flexible(
         // fit: BoxFit.contain,
          child: Text(cityName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.roboto(
            color:AppConst.baseColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          ),
        ),



      


      ],
    );
  }
}