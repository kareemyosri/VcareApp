  import 'package:either_dart/either.dart';
import 'package:my_app/booking/data/model/booking_model/booking_model.dart';
import 'package:my_app/util/error.dart';

abstract class  HomeRepo {
  Future<Either<Failuer,BookingModel>> creatBooking({required Map<String,dynamic> queryParameters});
}