import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/booking/data/model/booking_model/booking_model.dart';
import 'package:my_app/booking/data/repo/home_repo_imple.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(this.homeRepoImple) : super(BookingInitial());

  final HomeRepoImple homeRepoImple;

  //دى عشان اغير لون الزرار
  List<bool> isChose = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  Future<void> creatBooking(
      {required Map<String, dynamic> queryParameters}) async {
    emit(BookingIsLoadin());
    var result =
        await homeRepoImple.creatBooking(queryParameters: queryParameters);

    result.fold(
      (left) => emit(
        BookingIsFailuer(erroMessage: left.erroMessage),
      ),
      (right) => emit(
        BookingIsSuccessfuly(bookingModel: right),
      ),
    );
  }

  void changeColor(int index) {
    emit(ChangeState());
    for (var i = 0; i < isChose.length; i++) {
      i == index ? isChose[i] = true : isChose[i] = false;
    }
    emit(ChangeColor());
  }
}
