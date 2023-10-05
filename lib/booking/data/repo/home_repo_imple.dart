import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:my_app/booking/data/model/booking_model/booking_model.dart';
import 'package:my_app/booking/data/repo/home_repo.dart';
import 'package:my_app/util/api_server.dart';
import 'package:my_app/util/app_const.dart';
import 'package:my_app/util/error.dart';

class HomeRepoImple implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImple({required ApiService apiService}) : _apiService = apiService;
  @override
  Future<Either<Failuer, BookingModel>> creatBooking(
      {required Map<String, dynamic> queryParameters}) async {
    try {
      ///appointment/store

      var response = await _apiService.post(
          endpoint: AppConst.booking, queryParameters: queryParameters,
          );
      return Right(
        BookingModel.fromJson(response.data),
      );
    }  catch (e) {
      if(e is DioException){
        return Left(ServerFailuer(e.response!.data['data']['start_time'][0],),);
      }
      return Left(ServerFailuer('There is Problem ${e.toString()} '),);
    }
  }
}
