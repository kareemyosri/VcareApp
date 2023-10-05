import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custombottom extends StatelessWidget {
  const Custombottom({super.key, required this.text,  required this.ontap});
  final String text;

final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: ontap,
            style: ElevatedButton.styleFrom(
              padding:const EdgeInsets.symmetric(vertical: 20),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              backgroundColor:  const Color(0XFF174068),
            ),
            child: Text(
              text,
              style: GoogleFonts.roboto().copyWith(
                color: const Color(0xffFFFFFF),
                fontSize: 14
              )
            ),
          ),
        ),
      ],
    );
  }
}