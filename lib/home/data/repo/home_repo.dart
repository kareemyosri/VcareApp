import 'package:either_dart/either.dart';
import 'package:my_app/home/data/model/specialization_model.dart';
import 'package:my_app/util/error.dart';

abstract class HomeRpo{

  Future<Either<Failuer,List<SpecializationModel>>>getAllSpecialixation();
} 