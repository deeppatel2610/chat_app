import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String? message, sender, receiver, image, userImage;
  Timestamp time;
  bool isImage;

  ChatModel({
    required this.message,
    required this.time,
    required this.receiver,
    required this.sender,
    required this.userImage,
    required this.image,
    required this.isImage,
  });

  factory ChatModel.fromMap(Map m1) {
    return ChatModel(
      message: m1['massage'],
      time: m1['time'],
      receiver: m1['receiver'],
      sender: m1['sender'],
      userImage: m1['userImage'],
      image: m1['image'],
      isImage: m1['isImage'],
    );
  }

  Map<String, dynamic> toMap(ChatModel chat) {
    return {
      "massage": chat.message,
      "time": chat.time,
      "receiver": chat.receiver,
      "sender": chat.sender,
      "userImage": chat.userImage,
      "image": chat.image,
      "isImage": chat.isImage,
    };
  }
}
