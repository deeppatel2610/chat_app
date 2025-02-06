import 'package:chat_app/services/Auth/google_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Auth {
  Auth._();

  static Auth auth = Auth._();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> createAccountWithEmailAndPassword(String email, password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<String?> signInWithEmailAndPassword(String email, password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      return "error";
    }
    return "deep";
  }

  void signOut() {
    _firebaseAuth.signOut();
    GoogleAuth.googleAuth.googleSignOut();
  }

  User? currentUser() {
    User? user = _firebaseAuth.currentUser;
    return user;
  }
}
