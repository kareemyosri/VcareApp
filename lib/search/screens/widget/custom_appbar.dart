import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/search/manager/cubit/search_cubit.dart';
import 'package:my_app/search/screens/widget/custom_text_fild.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return     Card(
          elevation: 6,
          child: Row(
            children: [
            
              Expanded(
                child: CustomTextFiled(
                  onChanged: (String name) async {
                    if (name.isEmpty) {
                       BlocProvider.of<SearchCubit>(context).nameIsEmpty();
                    } else {
                       await BlocProvider.of<SearchCubit>(context).search(name: name);
                    }
                  },
                ),
              ),
            ],
          ),
        );
     }
}