part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}


final class ProfileInitial extends ProfileState {}

final class GetDataofProfilIsLoading extends ProfileState {}

final class GetDataofProfilIsSuccessfuly extends ProfileState {
  final ProfileModel profileModel;

const   GetDataofProfilIsSuccessfuly({required this.profileModel});
}

final class GetDataofProfilIsFailuer extends ProfileState {
  final String errorMessage;

const  GetDataofProfilIsFailuer({required this.errorMessage});
}

