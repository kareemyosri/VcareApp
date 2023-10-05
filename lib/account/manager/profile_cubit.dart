import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/account/data/model/profile_model.dart';
import 'package:my_app/account/data/repo/home_repo_imple.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._homeRepoImpleForProfile) : super(ProfileInitial());
  final HomeRepoImpleForProfile _homeRepoImpleForProfile;

  Future<void> getdataofUser() async {
    emit(GetDataofProfilIsLoading());
    var result = await _homeRepoImpleForProfile.getdataofUser();

    result.fold(
      (left) => emit(
        GetDataofProfilIsFailuer(errorMessage: left.erroMessage),
      ),
      (right) => emit(
        GetDataofProfilIsSuccessfuly(profileModel: right),
      ),
    );
  }
}
