import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:my_app/auth/data/model/user_model/user_model.dart';
import 'package:my_app/auth/data/repo/home_repo.dart';
import 'package:my_app/util/api_server.dart';
import 'package:my_app/util/app_const.dart';
import 'package:my_app/util/error.dart';

class HomeRepoImple implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImple({required ApiService apiService}) : _apiService = apiService;

  @override
  Future<Either<Failuer, UserModel>> signUp(
      {required Map<String, dynamic> queryParameters}) async {
    try {
      final value = await _apiService.post(
          endpoint: AppConst.rigister, queryParameters: queryParameters);
      UserModel userModel = UserModel.fromJson(value.data);
      return Right(userModel);
    } catch (e) {
      if (e is DioException) {
        if (e.response!.statusCode == 422) {
          if (e.response!.data['data'].containsKey('email') &&
              e.response!.data['data'].containsKey('phone')) {
            return Left(ServerFailuer(AppConst.phoneAndEmailIsFailuer));
          } else if (e.response!.data['data'].containsKey('email')) {
            return Left(ServerFailuer(AppConst.emailIsFailuer));
          } else if (e.response!.data['data'].containsKey('phone')) {
            return Left(ServerFailuer(AppConst.phoneIsFailuer));
          } else {
            return Left(ServerFailuer('There is a problem'));
          }
        }
        return Left(ServerFailuer('There is a problem'));
      } else {
        return Left(ServerFailuer('There is a problem'));
      }
    }
  }

  @override
  Future<Either<Failuer, UserModel>> login(
      {required Map<String, dynamic> queryParameters}) async {
    try {
      final response = await _apiService.post(
          endpoint: AppConst.login, queryParameters: queryParameters);
      return Right(UserModel.fromJson(response.data));
    } catch (e) {
      
      if (e is DioException) {
        
        if (e.response!.statusCode == 401) {
          return Left(
            ServerFailuer(
              e.response!.data['message'],
            ),
          );
        }
        return Left(ServerFailuer('opps there is proplem '));
      } else {
        return Left(
          ServerFailuer('opps there is proplem '),
        );
      }
    }
  }
  
}
