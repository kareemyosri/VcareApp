import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/city/manager/cubit/city_cubit.dart';
import 'package:my_app/city/widget/radio_bottom.dart';
import 'package:my_app/util/model/city.dart';

class CustomListViewCity extends StatelessWidget {
  const CustomListViewCity({super.key, required this.city});
  final List<City> city  ;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.separated(
        itemCount: city.length,
        itemBuilder: (BuildContext context, int index) => RadioTile(
          cityName: city[index].name.toString(),
          value: city[index].id!.toInt(),
          groupValue: BlocProvider.of<CityCubit>(context).buttonValue,
          onChanged: (value) {
            BlocProvider.of<CityCubit>(context).changeUserValue(value);
          },
        ),
        //CustomLanguageItem(index + 1, languages[index]),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}