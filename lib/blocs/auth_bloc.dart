


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthEvent{}
class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  LoginEvent(this.email, this.password);
}
class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  RegisterEvent(this.email, this.password);
}


abstract class AuthState{}
class AuthInital extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final String userId;
  AuthSuccess(this.userId);
}
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  AuthBloc() : super (AuthInital()) {

    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        var doc = await firestore
          .collection('users')
          .where('email', isEqualTo: event.email)
          .where('password', isEqualTo: event.password)
          .get();

        if(doc.docs.isNotEmpty){
          emit(AuthSuccess(doc.docs.first.id));
        } else {
          emit(AuthError("Invalid User"));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    },); 

    on<RegisterEvent> ((event, emit) async {
      emit(AuthLoading());
      try {
        if(event.email.isEmpty){
          emit(AuthError("Email must be filled"));
          return;
        } else if (event.password.length < 5){
          emit(AuthError("Password must be at least 5 letters"));
          return;
        }

        var doc = await firestore.collection('users').add({
          'email' : event.email,
          'password' : event.password
        });

        AuthSuccess(doc.id);

      } catch(e) {
        emit(AuthError(e.toString()));
      }
    },);
  }
}
