import 'package:either_dart/either.dart';
import 'package:my_app/history/data/model/history_model.dart';
import 'package:my_app/util/error.dart';

abstract class HomeRepo{
  Future<Either<Failuer,HistoryModel>>getAllAppointments();
}