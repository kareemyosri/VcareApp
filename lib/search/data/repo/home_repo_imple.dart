import 'package:either_dart/src/either.dart';
import 'package:my_app/search/data/repo/home_repo.dart';
import 'package:my_app/util/api_server.dart';
import 'package:my_app/util/app_const.dart';
import 'package:my_app/util/error.dart';
import 'package:my_app/util/model/doctor.dart';

class HomeRepoImpelForSearch implements HomeRepo{
  
  final ApiService _apiService;

  HomeRepoImpelForSearch({required ApiService apiService}) : _apiService = apiService;

  @override

  Future<Either<Failuer, List<Doctors>>> search({required String name})async {
      try {
    var response = await  _apiService.get(endpoint: '${AppConst.search}$name');
      List<dynamic>data = response.data['data'];
    return Right(data.map((e) => Doctors.fromJson(e)).toList());
} on Exception catch (e) {

  return Left(ServerFailuer('There is ptoblem ${e.toString()}'));
}
      
  }

}