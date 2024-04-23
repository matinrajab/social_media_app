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
      _postReference.add({
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
          post.postId = e.id;
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
    required String idCurrentUser,
    required String postId,
  }) async {
    try {
      DocumentReference postRef = _postReference.doc(postId);

      postRef.update({
        'likes': isLiked
            ? FieldValue.arrayUnion([idCurrentUser])
            : FieldValue.arrayRemove([idCurrentUser]),
      });
    } catch (e) {
      rethrow;
    }
  }
}
