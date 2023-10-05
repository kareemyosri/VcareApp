import 'package:either_dart/src/either.dart';
import 'package:my_app/history/data/model/history_model.dart';
import 'package:my_app/history/data/repo/home_repo.dart';
import 'package:my_app/util/api_server.dart';
import 'package:my_app/util/app_const.dart';
import 'package:my_app/util/error.dart';

class HomeRepoImpleForHistory implements HomeRepo{
  final ApiService _apiService;

  HomeRepoImpleForHistory({required ApiService apiService}) : _apiService = apiService;
  @override
  Future<Either<Failuer, HistoryModel>> getAllAppointments() async{
   
   try {
    var response = await  _apiService.get(endpoint:AppConst.hostory );
    return Right(HistoryModel.fromJson(response.data));
   } catch (e) {
    return Left(ServerFailuer('There is problem ${e.toString()}'),);
   }
  }

}