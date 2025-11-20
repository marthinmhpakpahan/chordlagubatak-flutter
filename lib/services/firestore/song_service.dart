import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/song.dart';
import 'firebase_collections.dart';

class SongService {
  // Get all songs
  Stream<List<Song>> getAllSongs() {
    return FirebaseCollections.songs
        .orderBy('title')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Song.fromMap(doc.data(), doc.id)).toList());
  }

  // Get songs by author
  Stream<List<Song>> getSongsByAuthor(String authorId) {
    return FirebaseCollections.songs
        .where('authorId', isEqualTo: authorId)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Song.fromMap(doc.data(), doc.id)).toList());
  }

  // Get a single song
  Future<Song?> getSong(String id) async {
    final doc = await FirebaseCollections.songs.doc(id).get();
    if (!doc.exists) return null;
    return Song.fromMap(doc.data()!, doc.id);
  }

  // Search songs by title (prefix search)
  Stream<List<Song>> searchSongs(String query) {
    return FirebaseCollections.songs
        .orderBy('title')
        .startAt([query])
        .endAt(['$query\uf8ff'])
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Song.fromMap(doc.data(), doc.id)).toList());
  }

  // Increment song view count
  Future<void> incrementViews(String id) {
    return FirebaseCollections.songs.doc(id).update({
      'views': FieldValue.increment(1),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }
}
