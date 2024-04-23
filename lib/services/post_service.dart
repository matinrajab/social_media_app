import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/models/post_model.dart';

class PostService {
  final CollectionReference _postReference =
      FirebaseFirestore.instance.collection('posts');

  Future<void> createPost({
    required String username,
    required String content,
  }) async {
    try {
      await _postReference.add({
        'username': username,
        'content': content,
        'timestamp': Timestamp.now(),
        'likes': [],
      });
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<PostModel>> getAllPosts() {
    try {
      return _postReference
          .orderBy('timestamp', descending: true)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<PostModel>((DocumentSnapshot e) {
          PostModel post = PostModel.fromJson(e.data() as Map<String, dynamic>);
          post.id = e.id;
          return post;
        }).toList();

        return result;
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> toggleLike({
    required bool isLiked,
    required String usernameCurrentUser,
    required String postId,
  }) async {
    try {
      DocumentReference postRef = _postReference.doc(postId);

      postRef.update({
        'likes': isLiked
            ? FieldValue.arrayUnion([usernameCurrentUser])
            : FieldValue.arrayRemove([usernameCurrentUser]),
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deletePost(String postId) async {
    try {
      CollectionReference commentReference =
          _postReference.doc(postId).collection('comments');

      var commentDocs = await commentReference.get();

      for (var doc in commentDocs.docs) {
        await commentReference.doc(doc.id).delete();
      }

      await _postReference.doc(postId).delete();
    } catch (e) {
      rethrow;
    }
  }
}
