import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final FirestoreService instance = FirestoreService._();
  FirestoreService._();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<DocumentSnapshot> getDoc(String path) =>
      _db.doc(path).get();

  Stream<QuerySnapshot> collectionStream(String path) =>
      _db.collection(path).snapshots();
}
