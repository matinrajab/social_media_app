import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/models/user_model.dart';

class UserService {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'username': user.username,
        'bio': user.bio,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
        id: id,
        email: snapshot['email'],
        name: snapshot['name'],
        username: snapshot['username'],
        bio: snapshot['bio'],
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUserField({
    required String id,
    required String field,
    required String newValue,
  }) async {
    try {
      await _userReference.doc(id).update({field: newValue});
    } catch (e) {
      rethrow;
    }
  }
}
