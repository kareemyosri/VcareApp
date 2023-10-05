import 'package:either_dart/src/either.dart';
import 'package:my_app/account/data/model/profile_model.dart';
import 'package:my_app/account/data/repo/home_repo.dart';
import 'package:my_app/util/api_server.dart';
import 'package:my_app/util/app_const.dart';
import 'package:my_app/util/error.dart';

class HomeRepoImpleForProfile implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpleForProfile({required ApiService apiService}) : _apiService = apiService;

  @override
  Future<Either<Failuer, ProfileModel>> getdataofUser() async {
    try {
      var response = await _apiService.get(endpoint: AppConst.profile);
      print(response.data);
      return Right(ProfileModel.fromJson(response.data['data'][0]));
    } on Exception catch (e) {
      return Left(
        ServerFailuer('There is Problem ${e.toString()}'),
      ); // TODO
    }
  }
}
