

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_fltr_lnt_a/models/transaction_model.dart';



abstract class TransactionEvent {}

class LoadTransactions extends TransactionEvent {}

class TransactionUpdated extends TransactionEvent {
  List<TransactionModel> transactions;
  TransactionUpdated(this.transactions);
}

class AddTransactions extends TransactionEvent {
  TransactionModel transaction;
  AddTransactions(this.transaction);
}

class UpdateTransactions extends TransactionEvent {
  TransactionModel transaction;
  UpdateTransactions(this.transaction);
}

class DeleteTransactions extends TransactionEvent {
  String id;
  DeleteTransactions(this.id);
}


abstract class TransactionState {}

class TransactionInitial extends TransactionState {}
class TransactionLoading extends TransactionState {}
class TransactionLoaded extends TransactionState {
  List<TransactionModel> transactions;
  TransactionLoaded(this.transactions);
}

class TransactionBloc extends Bloc<TransactionEvent, TransactionState>{

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String get uid => FirebaseAuth.instance.currentUser!.uid;

  CollectionReference get transactionRef => firestore.collection('users').doc(uid).collection('transactions');

  StreamSubscription? subscription;
  
  TransactionBloc() : super(TransactionInitial()){
    on<LoadTransactions>((event, emit) {

      emit(TransactionLoading());

      subscription?.cancel();

      subscription = transactionRef.orderBy('date', descending: true).snapshots().map((snapshot) {
        return snapshot.docs.map((e) {
          return TransactionModel.fromMap(e.data() as Map<String, dynamic>, e.id);
        },).toList();
      },).listen((transactions) {
        add(TransactionUpdated(transactions));
      },);
      
    },);

    on<TransactionUpdated>((event, emit) {
      emit(TransactionLoaded(event.transactions));
    },);


    on<AddTransactions>((event, emit) async {
      await transactionRef.add(event.transaction.toMap());
    },);

    on<UpdateTransactions>((event, emit) async {
      await transactionRef.doc(event.transaction.id).update(event.transaction.toMap());
    },);

    on<DeleteTransactions>((event, emit) async {
      await transactionRef.doc(event.id).delete();
    },);
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}