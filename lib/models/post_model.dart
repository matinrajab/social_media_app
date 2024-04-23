import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String? id;
  final String username;
  final String content;
  final Timestamp timestamp;
  final List<String> likes;
  int? totalComment;

  PostModel({
    this.id,
    required this.username,
    required this.content,
    required this.timestamp,
    required this.likes,
    this.totalComment,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json['id'],
        username: json['username'],
        content: json['content'],
        timestamp: json['timestamp'],
        likes: List<String>.from(json['likes']),
        totalComment: json['totalComment'],
      );
}
