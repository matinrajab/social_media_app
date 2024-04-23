import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  String? id;
  final String commentator;
  final String content;
  final Timestamp timestamp;

  CommentModel({
    this.id,
    required this.commentator,
    required this.content,
    required this.timestamp,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json['id'],
        commentator: json['commentator'],
        content: json['content'],
        timestamp: json['timestamp'],
      );
}
