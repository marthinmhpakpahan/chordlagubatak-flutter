import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String id;
  final String? name;
  final String email;
  final List<String> favorites;
  final Timestamp createdAt;

  UserProfile({
    required this.id,
    this.name,
    required this.email,
    required this.favorites,
    required this.createdAt,
  });

  factory UserProfile.fromMap(Map<String, dynamic> data, String documentId) {
    return UserProfile(
      id: documentId,
      name: data['name'],
      email: data['email'] ?? '',
      favorites: List<String>.from(data['favorites'] ?? []),
      createdAt: data['createdAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'favorites': favorites,
      'createdAt': createdAt,
    };
  }

  UserProfile copyWith({
    String? name,
    String? email,
    List<String>? favorites,
    Timestamp? createdAt,
  }) {
    return UserProfile(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      favorites: favorites ?? this.favorites,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
