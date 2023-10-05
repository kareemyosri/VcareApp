part of 'filter_cubit.dart';

sealed class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object> get props => [];
}

final class FilterInitial extends FilterState {}

final class FilterIsSuccessfuly extends FilterState {}

final class FilterIsFailuer extends FilterState {
  final String errorMessage;

  const FilterIsFailuer({required this.errorMessage});
}

final class FilterIsLoading extends FilterState {}
