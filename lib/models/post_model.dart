import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final String username;
  final String content;
  final Timestamp timestamp;

  const PostModel({
    required this.username,
    required this.content,
    required this.timestamp,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        username: json['username'],
        content: json['content'],
        timestamp: json['timestamp'],
      );

  @override
  List<Object?> get props => [username, content, timestamp];
}
