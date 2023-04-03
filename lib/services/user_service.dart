import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lihatin/models/user_model.dart';

class UserService {
  CollectionReference _userRefrence =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userRefrence.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'genre': user.genre,
        'balance': user.balance,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userRefrence.doc(id).get();
      return UserModel(
          id: id,
          email: snapshot['email'],
          name: snapshot['name'],
          genre: snapshot['genre'],
          balance: snapshot['balance']);
    } catch (e) {
      throw e;
    }
  }
}
