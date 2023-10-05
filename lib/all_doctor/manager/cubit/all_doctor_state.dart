part of 'all_doctor_cubit.dart';

sealed class AllDoctorState extends Equatable {
  const AllDoctorState();

  @override
  List<Object> get props => [];
}

final class AllDoctorInitial extends AllDoctorState {}
final class GetAllDoctorIsLoading extends AllDoctorState {}
final class GetAllDoctorIsFailuer extends AllDoctorState {
  final String errorMessage;

const   GetAllDoctorIsFailuer({required this.errorMessage});
}
final class GetAllDoctorIsSuccessfuly extends AllDoctorState {
  final List<Doctors>alldoctor;

const  GetAllDoctorIsSuccessfuly({required this.alldoctor});
}
