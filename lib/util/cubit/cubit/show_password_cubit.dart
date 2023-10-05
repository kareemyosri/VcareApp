import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'show_password_state.dart';

class ShowPasswordCubit extends Cubit<ShowPasswordState> {
  ShowPasswordCubit() : super(ShowPasswordInitial());
  List<bool> isShow = [true, true,true];

  void showPassword(int index) {
    emit(ChangeState());
    if (index == 0) {
      isShow[0] = !isShow[0];
    }else if (index == 1){
isShow[1] = !isShow[1];
    } else {
  isShow[2] = !isShow[2];
      
    }

    isShow[index] == true ? emit(HidePassword()) : emit(ShowPassowrd());
  }

  void showPasswordConfirmation() {
    emit(ChangeState());
    isShow[1] = !isShow[1];
    isShow == true ? emit(ShowPassowrd()) : emit(HidePassword());
  }
}
