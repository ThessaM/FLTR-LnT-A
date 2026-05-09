
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  String id;
  String title;
  String category;
  double amount;
  String type;
  DateTime date;

  TransactionModel({
    required this.id,
    required this.title,
    required this.category,
    required this.amount,
    required this.type,
    required this.date,
  });

  factory TransactionModel.fromMap(Map<String, dynamic> map, String id) {
    return TransactionModel(
      id: id,
      title: map['title'],
      category: map['category'],
      amount: map['amount'],
      type: map['type'],
      date: (map['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'category': category,
      'amount': amount,
      'type': type,
      'date': date,
    };
  }
}