part of 'booking_cubit.dart';

sealed class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

final class BookingInitial extends BookingState {}

final class ChangeState extends BookingState {}

final class ChangeColor extends BookingState {}

final class BookingIsLoadin extends BookingState {}

final class BookingIsFailuer extends BookingState {
  final String erroMessage;

  const BookingIsFailuer({required this.erroMessage});
}

final class BookingIsSuccessfuly extends BookingState {
  final BookingModel bookingModel;

  const BookingIsSuccessfuly({required this.bookingModel});
}
