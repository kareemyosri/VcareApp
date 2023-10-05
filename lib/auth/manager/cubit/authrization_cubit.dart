import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/auth/data/model/user_model/user_model.dart';
import 'package:my_app/auth/data/repo/home_repo_imple.dart';

part 'authrization_state.dart';

class AuthrizationCubit extends Cubit<AuthrizationState> {
  AuthrizationCubit(this._homeRepoImple) : super(AuthrizationInitial());
  final HomeRepoImple _homeRepoImple;
  int gender = 0;
  List<bool> isMain = [true, false,false];
  String? erroMessag;
  Future<void> signUp({required Map<String, dynamic> queryParameters}) async {
    emit(StateIsLoading());
    var result = await _homeRepoImple.signUp(queryParameters: queryParameters);

    result.fold(
      (left) {
        erroMessag = left.erroMessage;
        emit(StateIsFailuer());
      },
      (right) => emit(
        StateIsSuccessfuly(userModel: right),
      ),
    );
  }


  Future<void>login({required Map<String,dynamic>queryParameters})async{
    emit(LoginIsLoadin());
    var result = await _homeRepoImple.login(queryParameters: queryParameters);
    result.fold((left) {
      erroMessag = left.erroMessage;
      emit(LoginIsFailuer(),);
    }, (right) => emit(LoginIsSuccessfuly(userModel: right)));

  }
   
  void changeColor({required int number}) {
    emit(ChangeStat());
    if (number == 0) {
      gender = 0;
      isMain[0] = true;
      isMain[1] = false;
    } else if (number == 1) {
      gender = 1;
      isMain[1] = true;
      isMain[0] = false;
    }else{
      isMain[number] =  !isMain[number];
    }
    emit(ChangeColor());
  }
}
