import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/search/manager/cubit/search_cubit.dart';
import 'package:my_app/search/screens/widget/custom_appbar.dart';
import 'package:my_app/util/widget/custom_lis_view.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),
    
        SizedBox(height: 12.h),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchIsLoading) {
              return _buildlinearprogressindecator();
            } else if (state is SearchIsSuccessfuly) {
              return CustomListView(all_doctor: state.doctor);
            } else if (state is SearchIsEmpty) {
               
              return _showMessag(
                  context, 'Doctor  name not found', 'image/empty.gif');
            } else if (state is SearchIsFailuer) {
              return Center(
                child: Text(
                  state.erroMessage,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              );
            } else {
           
              return _showMessag(
                  context, 'Enter the doctor name', 'image/loading.gif');
            }
          },
        )
      ],
    );
  }

  Column _showMessag(BuildContext context, String text, String image) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(image)),
        SizedBox(
          height: 12.h,
        ),
        Text(
         text,
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }

  Padding _buildlinearprogressindecator() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: LinearProgressIndicator(
        backgroundColor: Colors.red,
        color: Colors.black,
        minHeight: 5,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
