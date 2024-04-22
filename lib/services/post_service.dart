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
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PostModel>> getPosts() async {
    try {
      QuerySnapshot result = await _postReference
          .orderBy(
            'timestamp',
            descending: true,
          )
          .get();

      List<PostModel> posts = result.docs
          .map((e) => PostModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();

      return posts;
    } catch (e) {
      rethrow;
    }
  }
}
