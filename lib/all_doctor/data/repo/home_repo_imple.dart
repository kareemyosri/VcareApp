import 'package:either_dart/src/either.dart';
import 'package:my_app/all_doctor/data/repo/home_repo.dart';
import 'package:my_app/util/api_server.dart';
import 'package:my_app/util/app_const.dart';
import 'package:my_app/util/error.dart';
import 'package:my_app/util/model/doctor.dart';

class HomeRepoImpleForDoctor implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpleForDoctor({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<Either<Failuer, List<Doctors>>> getAllDoctor() async {
    try {
      var response = await _apiService.get(endpoint: AppConst.getAllDoctor);
      List<dynamic> data = response.data['data'];
      List<Doctors> doctor = data.map((e) => Doctors.fromJson(e)).toList();
      return Right(doctor);
    } catch (e) {
      print(e.toString());
      return Left(
        ServerFailuer('There is problem ${e.toString()}'),
      );
    }
  }
}
