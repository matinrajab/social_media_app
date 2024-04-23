import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String? postId;
  final String username;
  final String content;
  final Timestamp timestamp;
  final List<String> likes;

  PostModel({
    this.postId,
    required this.username,
    required this.content,
    required this.timestamp,
    required this.likes,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        postId: json['postId'],
        username: json['username'],
        content: json['content'],
        timestamp: json['timestamp'],
        likes: List<String>.from(json['likes']),
      );
}
