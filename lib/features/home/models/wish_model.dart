import 'package:cloud_firestore/cloud_firestore.dart';

class WishModel {
  WishModel({
    this.id,
    required this.title,
    required this.date,
  });

  String? id;
  final String title;
  final DateTime date;

  factory WishModel.fromSnapshot(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    return WishModel(
      id: document.id,
      title: data['title'],
      date: data['date'].toDate(),
    );
  }

  WishModel copyWith({
    String? title,
    DateTime? date,
  }) {
    return WishModel(
      id: id,
      title: title ?? this.title,
      date: date ?? this.date,
    );
  }

  Map<String, Object> toDocument() {
    return {
      'title': title,
      'date': date,
    };
  }
}
