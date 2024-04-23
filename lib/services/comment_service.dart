import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/models/comment_model.dart';

class CommentService {
  final CollectionReference _postReference =
      FirebaseFirestore.instance.collection('posts');

  Future<void> addComment({
    required String content,
    required String usernameCurrentUser,
    required String postId,
  }) async {
    try {
      await _postReference.doc(postId).collection('comments').add({
        'content': content,
        'commentator': usernameCurrentUser,
        'timestamp': Timestamp.now(),
      });
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<CommentModel>> getCommentsByPostId(String postId) {
    try {
      return _postReference
          .doc(postId)
          .collection('comments')
          .orderBy(
            'timestamp',
            descending: true,
          )
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<CommentModel>((DocumentSnapshot e) {
          CommentModel comment =
              CommentModel.fromJson(e.data() as Map<String, dynamic>);
          comment.id = e.id;
          return comment;
        }).toList();

        return result;
      });
    } catch (e) {
      rethrow;
    }
  }
}
