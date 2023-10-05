import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/account/data/repo/home_repo_imple.dart';
import 'package:my_app/account/manager/profile_cubit.dart';
import 'package:my_app/all_doctor/data/repo/home_repo_imple.dart';
import 'package:my_app/all_doctor/manager/cubit/all_doctor_cubit.dart';
import 'package:my_app/city/widget/bottom_sheer.dart';
import 'package:my_app/history/manager/history_cubit.dart';
import 'package:my_app/home/data/repo/home_repo_imple.dart';
import 'package:my_app/home/manager/cubit/specialization_cubit.dart';
import 'package:my_app/home/screens/widget/custom_presisten_tab.dart';
import 'package:my_app/search/data/repo/home_repo_imple.dart';
import 'package:my_app/search/manager/cubit/search_cubit.dart';
import 'package:my_app/util/api_server.dart';
import 'package:my_app/util/app_const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HistoryCubit>(context).getAllAppointments();
    return MultiBlocProvider(
      providers: [
          BlocProvider(
          create: (context) => ProfileCubit(
            HomeRepoImpleForProfile(
              apiService: ApiService(),
            ),
          )..getdataofUser(),
        ),
          
        BlocProvider(
          create: (context) => SpecializationCubit(
            HomeRepoImple(
              apiService: ApiService(),
            ),
          )..getAllSpecialixation(),
        ),
        BlocProvider(
            create: (context) => AllDoctorCubit(HomeRepoImpleForDoctor(
                  apiService: ApiService(),
                ))
                  ..getAllDoctor()),
        BlocProvider(
          create: (context) => SearchCubit(
            HomeRepoImpelForSearch(
              apiService: ApiService(),
            ),
          ),
        ),
       
      ],
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions: [
             
                
                IconButton(

                    onPressed: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return const CustomSheetBottom();
                          });
                    },
                    icon: const Icon(FontAwesomeIcons.filter))
              ],
              backgroundColor: AppConst.baseColor,
              elevation: 0,
              title: Text(
                'VCare',
                style: GoogleFonts.roboto().copyWith(
                    color: const Color(0xffF3FAF9),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            body: const CustomPresistenTabview()),
      ),
    );
  }
}
