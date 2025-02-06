import 'package:chat_app/model/chat_model.dart';
import 'package:chat_app/services/Auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore {
  FireStore._();

  static FireStore fireStore = FireStore._();
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

  /// Todo: user
  Future<void> insertUserFireStore(
      {required String email,
      required String name,
      required String userId,
      required String userImage,
      required bool isOnline}) async {
    await _firebaseFireStore.collection("user").doc(email).set({
      'email': email,
      'name': name,
      'userId': userId,
      'userImage': userImage,
      'isOnline': isOnline,
    });
  }

  Future<void> editOnlineAndOffline({
    required String email,
    required bool isOnline,
  }) async {
    await _firebaseFireStore.collection("user").doc(email).update({
      'isOnline': isOnline,
    });
  }

  Future<void> editUser({
    required String userEmail,
    required String edit,
    required String editMessage,
  }) async {
    await _firebaseFireStore.collection("user").doc(userEmail).update({
      edit: editMessage,
    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> readUserFireStore() async {
    return await _firebaseFireStore
        .collection("user")
        .doc(Auth.auth.currentUser()!.email)
        .get();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readAllUserFireStore() {
    return _firebaseFireStore.collection("user").snapshots();
  }

  /// Todo: chat
  String docIdForChat(String sender, String receiver) {
    List userId = [sender, receiver];
    userId.sort();
    return userId.join("_");
  }

  Future<void> addChatInFireStore(ChatModel chat) async {
    String docId = docIdForChat(chat.sender!, chat.receiver!);
    await _firebaseFireStore
        .collection("ChatRoom")
        .doc(docId)
        .collection("Chat")
        .add(chat.toMap(chat));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readChatFromFireStore(
      String sender, String receiver) {
    String docId = docIdForChat(sender, receiver);
    return _firebaseFireStore
        .collection("ChatRoom")
        .doc(docId)
        .collection("Chat")
        .orderBy("time", descending: false)
        .snapshots();
  }

  void deleteMessage(String sender, String receiver, var deleteId) {
    String docId = docIdForChat(sender, receiver);
    _firebaseFireStore
        .collection("ChatRoom")
        .doc(docId)
        .collection("Chat")
        .doc(deleteId)
        .delete();
  }

  void editMessage({
    required String sender,
    required String receiver,
    required var editId,
    required String message,
    required Timestamp time,
  }) {
    String docId = docIdForChat(sender, receiver);
    _firebaseFireStore
        .collection("ChatRoom")
        .doc(docId)
        .collection("Chat")
        .doc(editId)
        .update({
      "massage": message,
      "time": time,
    });
  }
}
