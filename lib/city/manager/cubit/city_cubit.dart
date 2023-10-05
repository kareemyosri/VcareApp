
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/city/data/repo/home_repo_imple.dart';
import 'package:my_app/util/model/city.dart';

part 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  CityCubit(this._homeRepoImple) : super(CityInitial());
  final HomeRepoImpleForCity _homeRepoImple;
     List<City>allcity = [];

  Future<void> getAllCity() async {
    emit(GetAllCityIsLoading());
    var result = await _homeRepoImple.getAllCity();

    result.fold(
      (left) => emit(GetAllCityIsFailuer(errorMessage: left.erroMessage)),
      (right) { 
        
        allcity = right;
        emit(
        GetAllCityIsSuccessfuly(),
      );}
    );
  }


  int buttonValue = 1;

        changeUserValue(value) {
          emit(ChangeState());
    buttonValue = value;
    emit(ChangecityFilterState());
    }

}
