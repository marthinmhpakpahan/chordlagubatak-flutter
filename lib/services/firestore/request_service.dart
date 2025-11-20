import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/song_request.dart';
import '../../models/update_request.dart';
import 'firebase_collections.dart';

class RequestService {
  // Submit request for new song
  Future<void> createSongRequest(SongRequest request) {
    return FirebaseCollections.songRequests.add(request.toMap());
  }

  // Submit request to update an existing song
  Future<void> createUpdateRequest(UpdateRequest request) {
    return FirebaseCollections.updateRequests.add(request.toMap());
  }

  // Get user's own requests
  Stream<List<SongRequest>> getUserSongRequests(String userId) {
    return FirebaseCollections.songRequests
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => SongRequest.fromMap(doc.data(), doc.id)).toList());
  }
}
