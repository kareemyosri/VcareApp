import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/home/data/model/specialization_model.dart';
import 'package:my_app/home/manager/cubit/specialization_cubit.dart';
import 'package:my_app/home/screens/widget/custom_list_view.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key, });

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SpecializationCubit, SpecializationState>(
              builder: (context, state) {
                if (state is SpecializationIsFailuer) {
                  return Center(
                    child: Text(
                      state.erroMessage,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  );
                } else if (state is SpecializationIsSuccessfuly) {
                  return _buildListview(state.specializationModel);
                
                }else {
                  return const Center(child: CircularProgressIndicator(),);
                }
              },
            );
  }

  Column _buildListview(List<SpecializationModel>specializationModel) {
    return Column(
    children: [
      Expanded(
        child: ListView.builder(
            itemCount: specializationModel.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textInfo(specializationModel[index].name.toString()),
                    CustomListView(
                      alldoctor: specializationModel[index].doctors!.toList(),
                    ),
              SizedBox(height: 16.h)
                  ],
                ),
              );
            }),
      ),
    ],
  );
  }

  Widget textInfo(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Text(
        text,
        style: GoogleFonts.roboto().copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(3, 14, 25, 0.70)),
      ),
    );
  }
}
