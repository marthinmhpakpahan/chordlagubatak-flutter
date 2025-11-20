import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/author.dart';
import 'firebase_collections.dart';

class AuthorService {
  Stream<List<Author>> getAuthors() {
    return FirebaseCollections.authors
        .orderBy('name')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Author.fromMap(doc.data(), doc.id)).toList());
  }

  Future<Author?> getAuthor(String id) async {
    final doc = await FirebaseCollections.authors.doc(id).get();
    if (!doc.exists) return null;
    return Author.fromMap(doc.data()!, doc.id);
  }
}
