import 'package:either_dart/src/either.dart';
import 'package:my_app/city/data/repo/home_repo.dart';
import 'package:my_app/util/api_server.dart';
import 'package:my_app/util/error.dart';
import 'package:my_app/util/model/city.dart';

class HomeRepoImpleForCity implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpleForCity({required ApiService apiService}) : _apiService = apiService;
  @override
  Future<Either<Failuer, List<City>>> getAllCity() async {
    try {
      var response = await _apiService.get(endpoint: '/city/index');
      List<dynamic> data = response.data['data'];
      return Right(data.map((e) => City.fromJson(e)).toList());
    } on Exception catch (e) {
      return Left(
        ServerFailuer('There is problem ${e.toString()}'),
      );
    }
  }
}
