import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/city/manager/cubit/city_cubit.dart';
import 'package:my_app/city/widget/custom_list_view_city.dart';
import 'package:my_app/filter/screens/filter_screen.dart';
import 'package:my_app/util/app_const.dart';
import 'package:my_app/util/widget/custom_bottom.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomSheetBottom extends StatelessWidget {
  const CustomSheetBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      height: MediaQuery.of(context).size.height * .6,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        // borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 22.h),
          Row(
            children: [
              const Icon(FontAwesomeIcons.filter),
              SizedBox(width: 12.w),
              Text(
                'FILTER',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(
                flex: 1,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  size: 24,
                  color: AppConst.baseColor,
                ),
              ),
              SizedBox(width: 12.w)
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Text(
              'City',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          BlocBuilder<CityCubit, CityState>(
            builder: (context, state) {
              if (state is GetAllCityIsFailuer) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              } else if (state is GetAllCityIsSuccessfuly) {
                return CustomListViewCity(city:  BlocProvider.of<CityCubit>(context).allcity,);
              } else if (state is ChangecityFilterState) {
                return   CustomListViewCity(city:  BlocProvider.of<CityCubit>(context).allcity,);
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
            },
          ),
          Custombottom(
              text: 'APPLY',
              ontap: () {
            
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: FilterScreen(
                      id: BlocProvider.of<CityCubit>(context).buttonValue,
                    ),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                
              }),
          SizedBox(height: 14.h)
        ],
      ),
    );
  }

}