import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/search/data/repo/home_repo_imple.dart';
import 'package:my_app/util/model/doctor.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._homeRepoImpelForSearch) : super(SearchInitial());
  final HomeRepoImpelForSearch _homeRepoImpelForSearch;

  Future<void> search({required String name}) async {
    emit(SearchIsLoading());

    var result = await _homeRepoImpelForSearch.search(name: name);

    result.fold(
      (left) => emit(SearchIsFailuer(erroMessage: left.erroMessage)),
      (right) {
        if (right.isEmpty) {
          emit(SearchIsEmpty());
        } else {
          emit(
            SearchIsSuccessfuly(doctor: right),
          );
        }
      },
    );
  }

  void nameIsEmpty(){
    emit(NameIsEmpty());
  }
}
