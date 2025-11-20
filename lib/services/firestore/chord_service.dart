import '../../models/chord.dart';
import 'firebase_collections.dart';

class ChordService {
  Future<Chord?> getChord(String name) async {
    final doc = await FirebaseCollections.chords.doc(name).get();
    if (!doc.exists) return null;

    return Chord.fromMap(doc.data()!, doc.id);
  }

  Stream<List<Chord>> getAllChords() {
    return FirebaseCollections.chords.snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => Chord.fromMap(doc.data(), doc.id)).toList());
  }
}
