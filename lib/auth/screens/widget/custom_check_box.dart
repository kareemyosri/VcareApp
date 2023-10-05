import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/manager/cubit/authrization_cubit.dart';

class CustomChckBox extends StatelessWidget {
  const CustomChckBox({super.key, required this.number,  this.gender});
  final int number;
  final String? gender;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthrizationCubit, AuthrizationState>(
      builder: (context, state) {
        return  Row(
          children: [
            gender!=null ?
            Text(gender!,style: GoogleFonts.roboto().copyWith(
              color: Colors.grey.shade500,
              fontWeight:FontWeight.w500,
              fontSize: 16
            ),):Container(),
            Checkbox(
              value: BlocProvider.of<AuthrizationCubit>(context).isMain[number],
              onChanged: (t) {
                BlocProvider.of<AuthrizationCubit>(context)
                    .changeColor(number: number);
              }),
          ],
        );
      },
 
    );
  }
}
