part of 'city_cubit.dart';

sealed class CityState extends Equatable {
  const CityState();

  @override
  List<Object> get props => [];
}


final class CityInitial extends CityState {}


final class GetAllCityIsLoading extends CityState {}


final class GetAllCityIsFailuer extends CityState {
  final String errorMessage;

const  GetAllCityIsFailuer({required this.errorMessage});
}


final class GetAllCityIsSuccessfuly extends CityState 
{

}


final class ChangecityFilterState extends CityState {}


final class ChangeState extends CityState {}

//ChangecityFilterState