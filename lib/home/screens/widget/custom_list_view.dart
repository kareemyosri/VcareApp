import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/home/screens/widget/item_list_view.dart';
import 'package:my_app/util/model/doctor.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.alldoctor});
  final List<Doctors> alldoctor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(      height: MediaQuery.of(context).size.height * .24.h,
      child: ListView.builder(
        itemCount: alldoctor.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index)=> ItemListView(doctor: alldoctor[index],)),
    );
  }
}