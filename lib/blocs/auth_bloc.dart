

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthEvent{}

class CheckAuthEvent extends AuthEvent {}
class LoginEvent extends AuthEvent{
  String email;
  String password;

  LoginEvent(this.email, this.password);
}

class RegisterEvent extends AuthEvent{
  String email;
  String password;

  RegisterEvent(this.email, this.password);
}

class LogoutEvent extends AuthEvent {}


abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class Authenticated extends AuthState {}
class UnAuthenticated extends AuthState {}
class AuthError extends AuthState {
  String message;
  AuthError(this.message);
}

class AuthBloc extends Bloc<AuthEvent, AuthState>{

  final FirebaseAuth auth = FirebaseAuth.instance;
  User? get currentUser => auth.currentUser;
  
  AuthBloc() : super(AuthInitial()) {

    on<CheckAuthEvent>((event, emit) {
      if(currentUser != null){
        emit(Authenticated());
      } else {
        emit(UnAuthenticated());
      }
    },);

    on<LoginEvent>((event, emit) async {
      try{
        emit(AuthLoading());

        await auth.signInWithEmailAndPassword(email: event.email, password: event.password);

        emit(Authenticated());

      } catch (e) {
        emit(AuthError(e.toString()));
      }
    },);


    on<RegisterEvent>((event, emit) async {
      try{

        emit(AuthLoading());

        await auth.createUserWithEmailAndPassword(email: event.email, password: event.password);

        emit(Authenticated());

      } catch (e) {
        emit(AuthError(e.toString()));
      }
    },);

    on<LogoutEvent>((event, emit) async {
      try{
        await auth.signOut();
        emit(UnAuthenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    },);
  }

}