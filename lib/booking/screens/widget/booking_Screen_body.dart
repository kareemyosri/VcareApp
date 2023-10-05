import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/booking/manager/cubit/booking_cubit.dart';
import 'package:my_app/booking/screens/widget/chose_time_widget.dart';
import 'package:my_app/history/manager/history_cubit.dart';
import 'package:my_app/util/app_const.dart';
import 'package:my_app/util/app_router.dart';
import 'package:my_app/util/model/doctor.dart';
import 'package:my_app/util/widget/custom_bottom.dart';

class BookingScreenBody extends StatelessWidget {
  const BookingScreenBody(
      {super.key, required this.controller, required this.doctor});
  final TextEditingController controller;
  final Doctors doctor;

  @override
  Widget build(BuildContext context) {
    int indextime = 0;
    final List<String> availableTimes = [
      '14:00',
      '15:00',
      '16:00',
      '17:00',
      '18:00',
      '19:00',
      '20:00',
    ];
    String? date;
    String? time;
    final cubit = BlocProvider.of<BookingCubit>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.network(
            doctor.photo.toString(),
            width: MediaQuery.of(context).size.width * 1,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.name.toString(),
                  style: GoogleFonts.roboto().copyWith(
                      fontSize: 34,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(3, 14, 25, 0.70)),
                ),
                Text(
                  doctor.description.toString(),
                  style: GoogleFonts.roboto().copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(3, 14, 25, 0.70),
                      height: 2),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade500,
                ),
                SizedBox(
                  height: 8.h,
                ),
                _textInfo(text: 'Select date'),
                showTextfiled(
                  context,
                  () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2030),
                    );

                    if (selectedDate != null) {
                      final formattedDate =
                          '${selectedDate.year.toString().substring(2)}/${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.day.toString().padLeft(2, '0')}';
                      controller.text = formattedDate;
                      date = formattedDate;
                    }
                  },
                ),
                SizedBox(height: 16.h),
                _textInfo(text: 'Select time'),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 30.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: availableTimes.length,
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              time = availableTimes[index];
                              indextime = index;
                              cubit.changeColor(index);
                            },
                            child: ChoseTimeWidgt(
                              time: availableTimes[index],
                              index: index,
                            ),
                          )),
                ),
                SizedBox(
                  height: 60.h,
                ),
                BlocConsumer<BookingCubit, BookingState>(
                  builder: (context, state) {
                    if (state is BookingIsLoadin) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.black),
                      );
                    } else {
                      return Custombottom(
                        text: 'Book an appointment',
                        ontap: () async {
                          if (date == null || time == null) {
                            AppConst.showSnakbar(
                                context, 'The start time field is required.');
                          } else {
                            cubit.creatBooking(queryParameters: {
                              "doctor_id": doctor.id.toString(),
                              // "start_time": "2021/09/27 16:00"
                              "start_time": "20$date $time"
                            });
                          }
                        },
                      );
                    }
                  },
                  listener: (context, state) {
                    if (state is BookingIsFailuer) {
                      AppConst.showSnakbar(context, state.erroMessage);
                    } else if (state is BookingIsSuccessfuly) {
                      Navigator.pushNamed(
                          context, AppRouter.bookinissuccessfuly);
                      controller.clear();
                      date = null;
                      time = null;
                      cubit.isChose[indextime] = false;
                      BlocProvider.of<HistoryCubit>(context).getAllAppointments();
                    }
                  },
                )
                           ,  SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Text _textInfo({required String text}) {
    return Text(
      text,
      style: GoogleFonts.roboto().copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: const Color.fromRGBO(3, 14, 25, 0.70)),
    );
  }

  Widget showTextfiled(BuildContext context, VoidCallback ontap) {
    return TextFormField(
      controller: controller,
      onTap: ontap,
      decoration: InputDecoration(
        hintText: controller.text.isEmpty ? 'yy/mm//dd' : controller.text,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 21,
          color: Color(0xff030E19),
        ),
      ),
    );
  }
}
