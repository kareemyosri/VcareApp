import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/search/data/repo/home_repo_imple.dart';
import 'package:my_app/search/manager/cubit/search_cubit.dart';
import 'package:my_app/search/screens/widget/search_screen_body.dart';
import 'package:my_app/util/api_server.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => SearchCubit(
        HomeRepoImpelForSearch(
          apiService: ApiService(),
        ),
      ),
      child:const  SearchScreenBody(),
    );
  }
}
