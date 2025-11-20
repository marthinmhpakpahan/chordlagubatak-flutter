import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateRequest {
  final String id;
  final String songId;
  final String userId;
  final String email;
  final String message;
  final String status;
  final Timestamp createdAt;

  UpdateRequest({
    required this.id,
    required this.songId,
    required this.userId,
    required this.email,
    required this.message,
    required this.status,
    required this.createdAt,
  });

  factory UpdateRequest.fromMap(Map<String, dynamic> data, String documentId) {
    return UpdateRequest(
      id: documentId,
      songId: data['songId'] ?? '',
      userId: data['userId'] ?? '',
      email: data['email'] ?? '',
      message: data['message'] ?? '',
      status: data['status'] ?? 'pending',
      createdAt: data['createdAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'songId': songId,
      'userId': userId,
      'email': email,
      'message': message,
      'status': status,
      'createdAt': createdAt,
    };
  }
}
