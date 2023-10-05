part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchIsLoading extends SearchState {}

final class SearchIsFailuer extends SearchState {
  final String erroMessage;

const  SearchIsFailuer({required this.erroMessage});
}

final class SearchIsSuccessfuly extends SearchState {
  final List<Doctors>doctor;

const   SearchIsSuccessfuly({required this.doctor});

}

final class SearchIsEmpty extends SearchState {

}


final class NameIsEmpty extends SearchState {

}

