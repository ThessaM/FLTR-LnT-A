


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final String phoneNumber;
  RegisterEvent(this.email, this.password, this.phoneNumber);
}

class LogoutEvent extends AuthEvent {}


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

        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: event.email, password: event.password);
        print("test");
        if(credential.user != null){
          var doc = await firestore
            .collection('users')
            .where('email', isEqualTo: event.email)
            .get();

          if(doc.docs.isNotEmpty){
            emit(AuthSuccess(doc.docs.first.id));
          } else {
            emit(AuthError("Email not exist"));
          }
        } else {
          emit(AuthError("User not exist"));
        }

      } on FirebaseException catch (e) {
        if(e.code == "invalid-credential"){
          emit(AuthError("User not exist in database"));
        } else {
          emit(AuthError(e.code));
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

        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: event.email, password: event.password);

        var doc = await firestore.collection('users').add({
          'email' : event.email,
          'phoneNumber' : event.phoneNumber,
        });

        AuthSuccess(doc.id);

      } on FirebaseException catch (e) {
        emit(AuthError(e.code));
      } catch(e) {
        emit(AuthError(e.toString()));
      }
    },);

    on<LogoutEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        await FirebaseAuth.instance.signOut();
        emit(AuthInital());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    },);
  }
}
