import 'package:cloud_firestore/cloud_firestore.dart';

class Author {
  final String id;
  final String name;
  final String? description;
  final String? photoUrl;
  final Timestamp createdAt;

  Author({
    required this.id,
    required this.name,
    this.description,
    this.photoUrl,
    required this.createdAt,
  });

  factory Author.fromMap(Map<String, dynamic> data, String documentId) {
    return Author(
      id: documentId,
      name: data['name'] ?? '',
      description: data['description'],
      photoUrl: data['photoUrl'],
      createdAt: data['createdAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'photoUrl': photoUrl,
      'createdAt': createdAt,
    };
  }

  Author copyWith({
    String? name,
    String? description,
    String? photoUrl,
    Timestamp? createdAt,
  }) {
    return Author(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      photoUrl: photoUrl ?? this.photoUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
