import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/history/data/model/history_model.dart';
import 'package:my_app/history/data/repo/home_repo_impel.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this._homerepoImpleforhistory) : super(HistoryInitial());
  final HomeRepoImpleForHistory _homerepoImpleforhistory;
  late HistoryModel historyModel;
  Future<void> getAllAppointments() async {
    emit(GetDataIsLoading());
    var result = await _homerepoImpleforhistory.getAllAppointments();

    result
        .fold((left) => emit(GetDataIsFailuer(errorMessage: left.erroMessage)),
            (right) {
      historyModel = right;
      emit(GetDataIsSuccessfuly());
    });
  }
}
