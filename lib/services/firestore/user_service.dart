import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/user_profile.dart';
import 'firebase_collections.dart';

class UserService {
  Future<UserProfile?> getUser(String uid) async {
    final doc = await FirebaseCollections.users.doc(uid).get();
    if (!doc.exists) return null;

    return UserProfile.fromMap(doc.data()!, doc.id);
  }

  Future<void> createUser(String uid, String email, {String? name}) async {
    return FirebaseCollections.users.doc(uid).set({
      'email': email,
      'name': name,
      'favorites': [],
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<UserProfile?> userStream(String uid) {
    return FirebaseCollections.users.doc(uid).snapshots().map((doc) {
      if (!doc.exists) return null;
      return UserProfile.fromMap(doc.data()!, doc.id);
    });
  }

  // Add song to favorites
  Future<void> addFavorite(String uid, String songId) {
    return FirebaseCollections.users.doc(uid).update({
      'favorites': FieldValue.arrayUnion([songId]),
    });
  }

  // Remove song from favorites
  Future<void> removeFavorite(String uid, String songId) {
    return FirebaseCollections.users.doc(uid).update({
      'favorites': FieldValue.arrayRemove([songId]),
    });
  }
}
