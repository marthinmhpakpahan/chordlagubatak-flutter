import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollections {
  static final songs = FirebaseFirestore.instance.collection('songs');
  static final authors = FirebaseFirestore.instance.collection('authors');
  static final chords = FirebaseFirestore.instance.collection('chords');
  static final users = FirebaseFirestore.instance.collection('users');
  static final songRequests = FirebaseFirestore.instance.collection('song_requests');
  static final updateRequests = FirebaseFirestore.instance.collection('update_requests');
}
