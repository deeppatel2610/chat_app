import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/chat_model.dart';
import '../../../../services/Auth/auth.dart';
import '../../../../services/fire store/fire_store.dart';


CupertinoContextMenuAction deleteMessageMethod(
    List<ChatModel> chat, int index, List<dynamic> docIdList) {
  return CupertinoContextMenuAction(
    trailingIcon: Icons.delete_outline,
    onPressed: () {
      if (Auth.auth.currentUser()!.email == chat[index].sender) {
        FireStore.fireStore.deleteMessage(
          chat[index].sender!,
          chat[index].receiver!,
          docIdList[index],
        );
        Get.back();
      }
    },
    isDestructiveAction: true,
    child: Text(
      "delete message",
      style: TextStyle(
        decoration: (Auth.auth.currentUser()!.email == chat[index].sender)
            ? TextDecoration.none
            : TextDecoration.lineThrough,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        letterSpacing: .5,
      ),
    ),
  );
}
