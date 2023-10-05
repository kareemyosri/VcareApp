import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/booking/data/repo/home_repo_imple.dart';
import 'package:my_app/booking/manager/cubit/booking_cubit.dart';
import 'package:my_app/booking/screens/widget/booking_Screen_body.dart';
import 'package:my_app/util/api_server.dart';
import 'package:my_app/util/model/doctor.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key, required this.doctor});
  final Doctors doctor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingCubit(
        HomeRepoImple(
          apiService: ApiService(),
        ),
      ),
      child: SafeArea(
        child: Scaffold(
            body: BookingScreenBody(
          controller: TextEditingController(),
          doctor: doctor,
        )),
      ),
    );
  }
}
