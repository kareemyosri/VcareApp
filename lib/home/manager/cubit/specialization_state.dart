part of 'specialization_cubit.dart';

sealed class SpecializationState extends Equatable {
  const SpecializationState();

  @override
  List<Object> get props => [];
}

final class SpecializationInitial extends SpecializationState {}
final class SpecializationIsLoading extends SpecializationState {}
final class SpecializationIsSuccessfuly extends SpecializationState {
  final List<SpecializationModel>specializationModel;

const   SpecializationIsSuccessfuly({required this.specializationModel});


}
final class SpecializationIsFailuer extends SpecializationState {
  final String erroMessage;

const   SpecializationIsFailuer({required this.erroMessage});
}
