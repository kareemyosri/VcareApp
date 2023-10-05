import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/account/manager/profile_cubit.dart';
import 'package:my_app/account/screens/widget/profile_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if(state is GetDataofProfilIsSuccessfuly){
          return ProfileScreenBody(profileModel: state.profileModel,);
          
        }else if(state is GetDataofProfilIsFailuer){
          return Center( child: Text(state.errorMessage,style: Theme.of(context).textTheme.titleLarge,),);
        }else {
          return const Center(child: CircularProgressIndicator(color: Colors.black),);

        }
      },
    );
  }
}