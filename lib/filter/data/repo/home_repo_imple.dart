import 'package:either_dart/src/either.dart';
import 'package:my_app/filter/data/repo/home_repo.dart';
import 'package:my_app/util/api_server.dart';
import 'package:my_app/util/app_const.dart';
import 'package:my_app/util/error.dart';
import 'package:my_app/util/model/doctor.dart';

class HomeRepoImpleforFilter implements HomeRepo{
final ApiService _apiService;

  HomeRepoImpleforFilter({required ApiService apiService}) : _apiService = apiService;
  @override
  Future<Either<Failuer, List<Doctors>>> filter({required int id}) async{

    try {
      var response = await  _apiService.get(endpoint: '${AppConst.filter}$id');
      List<dynamic>data = response.data['data'];
      List<Doctors> alldoctor= data.map((e) => Doctors.fromJson(e)).toList();
    return Right(alldoctor);
    } catch (e) {
      return Left(ServerFailuer('There is Problem ${e.toString()}'));
    }

  }

}