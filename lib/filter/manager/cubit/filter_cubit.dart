import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/filter/data/repo/home_repo_imple.dart';
import 'package:my_app/util/model/doctor.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  int a = 1;
  FilterCubit(this._homeRepoImpleforFilter) : super(FilterInitial());
  final HomeRepoImpleforFilter _homeRepoImpleforFilter;
  List<Doctors> doctor = [];
  Future<void> filter({required int id}) async {
    emit(FilterIsLoading());
    var result = await _homeRepoImpleforFilter.filter(id: id);
    result.fold((left) => emit(FilterIsFailuer(errorMessage: left.erroMessage)),
        (right) {
      doctor = right;
      print(right[0].name);
      emit(
        FilterIsSuccessfuly(),
      );
    });
  }
}
