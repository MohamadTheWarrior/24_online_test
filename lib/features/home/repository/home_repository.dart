import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twenty_four_online_interview_test/features/home/models/wish_model.dart';
import 'package:twenty_four_online_interview_test/features/home/repository/home_exceptions.dart';

abstract class IHomeRepository {
  Stream<List<WishModel>> get wishs;
  Future<DocumentReference> addWish(WishModel wish);
  Future<void> editWish(WishModel wish);
  Future<void> deleteWish(WishModel wish);
}

class FirebaseHomeRepository implements IHomeRepository {
  FirebaseHomeRepository();

  final wishsCollection = FirebaseFirestore.instance.collection('wishs');

  @override
  Stream<List<WishModel>> get wishs {
    return wishsCollection
        .orderBy(
          'date',
          descending: true,
        )
        .snapshots()
        .map(
      (snapshot) {
        return snapshot.docs
            .map(
              (doc) => WishModel.fromSnapshot(doc),
            )
            .toList();
      },
    );
  }

  @override
  Future<DocumentReference> addWish(WishModel wish) async {
    try {
      return wishsCollection.add(wish.toDocument());
    } catch (e) {
      debugPrint(e.toString());
      throw AddWishException(e.toString());
    }
  }

  @override
  Future<void> editWish(WishModel wish) async {
    debugPrint('id: ${wish.id}');
    try {
      await wishsCollection.doc(wish.id).set(
            wish.toDocument(),
          );
    } catch (e) {
      throw EditWishException(e.toString());
    }
  }

  @override
  Future<void> deleteWish(WishModel wish) async {
    try {
      await wishsCollection.doc(wish.id).delete();
    } catch (e) {
      throw DeleteWishException(e.toString());
    }
  }
}
