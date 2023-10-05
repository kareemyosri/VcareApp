
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/all_doctor/data/repo/home_repo_imple.dart';
import 'package:my_app/util/model/doctor.dart';

part 'all_doctor_state.dart';

class AllDoctorCubit extends Cubit<AllDoctorState> {
  AllDoctorCubit(this._homeRepoImpleForDoctor) : super(AllDoctorInitial());
  final HomeRepoImpleForDoctor _homeRepoImpleForDoctor;

  Future<void> getAllDoctor() async {
    emit(GetAllDoctorIsLoading());
    var result = await _homeRepoImpleForDoctor.getAllDoctor();

    result.fold(
      (left) => emit(GetAllDoctorIsFailuer(errorMessage: left.erroMessage)),
      (right) => emit(
        GetAllDoctorIsSuccessfuly(alldoctor: right),
      ),
    );
  }
}
