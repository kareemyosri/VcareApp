import 'package:either_dart/either.dart';
import 'package:my_app/account/data/model/profile_model.dart';
import 'package:my_app/util/error.dart';

abstract class HomeRepo{
  Future<Either<Failuer,ProfileModel>>getdataofUser();
}