import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/filter/data/repo/home_repo_imple.dart';
import 'package:my_app/filter/manager/cubit/filter_cubit.dart';
import 'package:my_app/util/api_server.dart';
import 'package:my_app/util/widget/custom_list_view_to_show_all_dpctor.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FilterCubit(
              HomeRepoImpleforFilter(
                apiService: ApiService(),
              ),
            )..filter(id: id),
        child: const SafeArea(child: Scaffold(body: FilterBody())));
  }
}

class FilterBody extends StatelessWidget {
  const FilterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        if (state is FilterIsFailuer) {
          return Text(state.errorMessage);
        } else if (state is FilterIsSuccessfuly) {
         return
          CustomListViwToShowAllDoctor(
              all_doctor: BlocProvider.of<FilterCubit>(context).doctor);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
