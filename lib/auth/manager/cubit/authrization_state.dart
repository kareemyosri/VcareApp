part of 'authrization_cubit.dart';

sealed class AuthrizationState extends Equatable {
  const AuthrizationState();

  @override
  List<Object> get props => [];
}

final class AuthrizationInitial extends AuthrizationState {}

final class StateIsLoading extends AuthrizationState {}

final class StateIsFailuer extends AuthrizationState {
}

 final class StateIsSuccessfuly extends AuthrizationState {
 final  UserModel userModel;

 const  StateIsSuccessfuly({required this.userModel});

 }


final class LoginIsLoadin extends AuthrizationState {}
final class LoginIsSuccessfuly extends AuthrizationState {
  final UserModel userModel;

const  LoginIsSuccessfuly({required this.userModel});
}
final class LoginIsFailuer extends AuthrizationState {
}

final class ChangeStat extends AuthrizationState {}

final class ChangeColor extends AuthrizationState {}



