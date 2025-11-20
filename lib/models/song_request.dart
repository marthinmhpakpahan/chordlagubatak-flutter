import 'package:cloud_firestore/cloud_firestore.dart';

class SongRequest {
  final String id;
  final String userId;
  final String email;
  final String title;
  final String authorName;
  final String note;
  final String status;
  final Timestamp createdAt;

  SongRequest({
    required this.id,
    required this.userId,
    required this.email,
    required this.title,
    required this.authorName,
    required this.note,
    required this.status,
    required this.createdAt,
  });

  factory SongRequest.fromMap(Map<String, dynamic> data, String documentId) {
    return SongRequest(
      id: documentId,
      userId: data['userId'] ?? '',
      email: data['email'] ?? '',
      title: data['title'] ?? '',
      authorName: data['authorName'] ?? '',
      note: data['note'] ?? '',
      status: data['status'] ?? 'pending',
      createdAt: data['createdAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'title': title,
      'authorName': authorName,
      'note': note,
      'status': status,
      'createdAt': createdAt,
    };
  }
}
