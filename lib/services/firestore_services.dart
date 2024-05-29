import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreServices {
  FirestoreServices._();
  static final instance = FirestoreServices._();
  final _firestore = FirebaseFirestore.instance;
  Future<void> addData(
      {required String path, required Map<String, dynamic> data}) async {
    final ref = _firestore.doc(path);
    debugPrint("Request Data: $data");
    await ref.set(data);
  }

  Future<void> deleteData({required String path}) async {
    final ref = _firestore.doc(path);
    debugPrint("Request Path: $path");
    await ref.delete();
  }

  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentId) builder,
    Query<Map<String, dynamic>>? query,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query<Map<String, dynamic>> ref = _firestore.collection(path);
    if (query != null) {
      ref = ref.where(query);
    }
    final snapshots = ref.snapshots();
    return snapshots.map((snapshot) {
      final documents = snapshot.docs;
      if (documents.isEmpty) {
        return [];
      }
      final data = documents
          .map((snapshot) => builder(snapshot.data(), snapshot.id))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        data.sort(sort);
      }
      return data;
    });
  }

  Stream<T> documentStream<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentId) builder,
  }) {
    final reference = _firestore.doc(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data()!, snapshot.id));
  }
}
