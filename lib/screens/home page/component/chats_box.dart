import 'package:chat_app/controller/declare_controller.dart';
import 'package:chat_app/screens/home%20page/component/sender_and_receiver_message_box.dart';
import 'package:flutter/material.dart';
import '../../../model/chat_model.dart';
import '../../../services/Auth/auth.dart';

Widget chatsBox(List<ChatModel> chat, int index) {
  return Padding(
    padding: const EdgeInsets.only(top: 3, bottom: 3),
    child: senderAndReceiverMessageBox(
      chat: chat,
      index: index,
      borderRadius: (Auth.auth.currentUser()!.email == chat[index].sender)
          ? const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            )
          : const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
    ),
  );
}
