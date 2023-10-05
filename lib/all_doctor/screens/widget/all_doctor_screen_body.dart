import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/all_doctor/manager/cubit/all_doctor_cubit.dart';
import 'package:my_app/util/widget/custom_list_view_to_show_all_dpctor.dart';

class AllDoctorScreenBody extends StatelessWidget {
  const AllDoctorScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllDoctorCubit, AllDoctorState>(
      builder: (context, state) {
        if (state is GetAllDoctorIsFailuer) {
          return Center(
            child: Text(
              state.errorMessage,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
        } else if (state is GetAllDoctorIsSuccessfuly) {
          return CustomListViwToShowAllDoctor(all_doctor: state.alldoctor,);
        } else {
          return const Center(
            child: CircularProgressIndicator(color: Colors.black),
          );
        }
      },
    );
  }

}


