import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/declare_controller.dart';
import '../../../../model/chat_model.dart';
import '../../../../services/Auth/auth.dart';
import '../../../../services/fire store/fire_store.dart';
import '../../../../utiitsl/my_color.dart';
import '../../../auth/sign in and sign up/component/box_input_method.dart';

CupertinoContextMenuAction editMessageMethod(List<ChatModel> chat, int index,
    BuildContext context, List<dynamic> docIdList) {
  return CupertinoContextMenuAction(
    trailingIcon: Icons.edit_outlined,
    onPressed: () {
      if (chat[index].sender == Auth.auth.currentUser()!.email) {
        chatController.txtMassageEdit.text = chat[index].message!;
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: bgColor,
            title: const Text(
              "Edit message",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: .5,
              ),
            ),
            content: boxInputMethod(
              isPassword: true,
              isBgColor: true,
              isIcon: false,
              isEmail: true,
              icon: Icons.sms_outlined,
              text: "Message",
              controller: chatController.txtMassageEdit,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  FireStore.fireStore.editMessage(
                    sender: chat[index].sender!,
                    receiver: chat[index].receiver!,
                    editId: docIdList[index],
                    message: chatController.txtMassageEdit.text,
                    time: Timestamp.now(),
                  );
                  Get.back();
                },
                child: const Text(
                  "Update",
                  style: TextStyle(fontSize: 15),
                ),
              )
            ],
          ),
        );
      }
    },
    child: Text(
      "edit message",
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
