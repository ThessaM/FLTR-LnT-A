

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_fltr_lnt_a/bloc/login_event.dart';
import 'package:main_fltr_lnt_a/bloc/login_state.dart';

class LoginBloc  extends Bloc<LoginEvent, LoginState>{

  String username = "admin";
  String password = "admin";

  LoginBloc() : super(LoginInitial()) {

    on<LoginSubmitted>((event, emit) async {

      emit(LoginLoading());
      await Future.delayed(Duration(seconds: 2));

      if(event.username == username && event.password == password){
        emit(LoginSuccess(username));
      }else {
        emit(LoginError("Invalid username or password"));
      }
    },);

    on<LogoutRequested>((event, emit) {
      emit(LoginInitial());
    },);

    on<UpdateProfile>((event, emit) {
      username = event.newUsername;
      password = event.newPassword;
      emit(LoginSuccess(username));
    },);
  }
}