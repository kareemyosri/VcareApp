import 'package:either_dart/either.dart';
import 'package:my_app/util/error.dart';
import 'package:my_app/util/model/city.dart';

abstract class HomeRepo{
  Future<Either<Failuer,List<City>>> getAllCity();
}