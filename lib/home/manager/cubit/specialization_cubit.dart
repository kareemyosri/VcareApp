import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/home/data/model/specialization_model.dart';
import 'package:my_app/home/data/repo/home_repo_imple.dart';

part 'specialization_state.dart';

class SpecializationCubit extends Cubit<SpecializationState> {
  SpecializationCubit(this._homeRepoImple) : super(SpecializationInitial());
  final HomeRepoImple _homeRepoImple;
  Future<void> getAllSpecialixation() async {
    emit(SpecializationIsLoading());
    var result = await _homeRepoImple.getAllSpecialixation();
    result.fold(
      (left) => emit(SpecializationIsFailuer(erroMessage: left.erroMessage)),
      (right) => emit(
        SpecializationIsSuccessfuly(specializationModel: right),
      ),
    );
  }
}
