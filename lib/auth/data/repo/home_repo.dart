import 'package:either_dart/either.dart';
import 'package:my_app/auth/data/model/user_model/user_model.dart';
import 'package:my_app/util/error.dart';

abstract class HomeRepo{
  Future<Either<Failuer,UserModel>> signUp({required Map<String,dynamic> queryParameters} );
  Future<Either<Failuer,UserModel>> login({required Map<String,dynamic> queryParameters} );

}