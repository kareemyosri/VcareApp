import 'package:either_dart/src/either.dart';
import 'package:my_app/home/data/model/specialization_model.dart';
import 'package:my_app/home/data/repo/home_repo.dart';
import 'package:my_app/util/api_server.dart';
import 'package:my_app/util/app_const.dart';
import 'package:my_app/util/error.dart';

class HomeRepoImple implements HomeRpo {
  final ApiService _apiService;

  HomeRepoImple({required ApiService apiService}) : _apiService = apiService;
  @override
  Future<Either<Failuer, List<SpecializationModel>>>
      getAllSpecialixation() async {
    try {
      var response = await _apiService.get(endpoint: AppConst.specialization);
      List<dynamic> data = response.data['data'];
      List<SpecializationModel> specializationModel =
          data.map((e) => SpecializationModel.fromJson(e)).toList();
      return Right(specializationModel);
    } on Exception catch (e) {
      print(e.toString());
      return Left(
        ServerFailuer('opps there is problem '),
      );
    }
  }
}
