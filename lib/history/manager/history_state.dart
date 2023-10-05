part of 'history_cubit.dart';

sealed class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

final class HistoryInitial extends HistoryState {}
final class GetDataIsLoading extends HistoryState {}
final class GetDataIsFailuer extends HistoryState {
  final String errorMessage;

const  GetDataIsFailuer({required this.errorMessage});
}
final class GetDataIsSuccessfuly extends HistoryState {


}
