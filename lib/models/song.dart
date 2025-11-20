import 'package:cloud_firestore/cloud_firestore.dart';

class Song {
  final String id;
  final String title;
  final String authorId;
  final String authorName;
  final String lyrics;         // pure lyrics
  final String chords;         // [C]Hello [G]world
  final List<String> tags;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  final int views;

  Song({
    required this.id,
    required this.title,
    required this.authorId,
    required this.authorName,
    required this.lyrics,
    required this.chords,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
    required this.views,
  });

  factory Song.fromMap(Map<String, dynamic> data, String documentId) {
    return Song(
      id: documentId,
      title: data['title'] ?? '',
      authorId: data['authorId'] ?? '',
      authorName: data['authorName'] ?? '',
      lyrics: data['lyrics'] ?? '',
      chords: data['chords'] ?? '',
      tags: List<String>.from(data['tags'] ?? []),
      createdAt: data['createdAt'] ?? Timestamp.now(),
      updatedAt: data['updatedAt'] ?? Timestamp.now(),
      views: data['views'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'authorId': authorId,
      'authorName': authorName,
      'lyrics': lyrics,
      'chords': chords,
      'tags': tags,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'views': views,
    };
  }

  Song copyWith({
    String? title,
    String? authorId,
    String? authorName,
    String? lyrics,
    String? chords,
    List<String>? tags,
    Timestamp? createdAt,
    Timestamp? updatedAt,
    int? views,
  }) {
    return Song(
      id: id,
      title: title ?? this.title,
      authorId: authorId ?? this.authorId,
      authorName: authorName ?? this.authorName,
      lyrics: lyrics ?? this.lyrics,
      chords: chords ?? this.chords,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      views: views ?? this.views,
    );
  }
}
