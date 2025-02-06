import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/declare_controller.dart';
import '../../../../model/chat_model.dart';
import '../../../../utiitsl/my_color.dart';
import '../info_text_method.dart';


CupertinoContextMenuAction infoMessageMethod(
    BuildContext context, int index, List<ChatModel> chat) {
  return CupertinoContextMenuAction(
    trailingIcon: Icons.info_outline,
    onPressed: () {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "Info message",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: .5,
              color: Colors.white,
            ),
          ),
          backgroundColor: bgColor,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              infoTextMethod(
                index: index,
                title: "Message",
                info: chat[index].message!,
              ),
              infoTextMethod(
                index: index,
                title: "Sender",
                info: settingsController.userData.name.toString(),
              ),
              infoTextMethod(
                index: index,
                title: "Receiver",
                info: chatController.receiverName.value,
              ),
              infoTextMethod(
                index: index,
                title: "Time",
                info:
                "${(chat[index].time.toDate().hour > 12) ? (chat[index].time.toDate().hour % 12).toString().padLeft(2, '0') : (chat[index].time.toDate().hour).toString().padLeft(2, '0')} : ${chat[index].time.toDate().minute.toString().padLeft(2, '0')} ${(chat[index].time.toDate().hour <= 12) ? ('AM') : ('PM')}",
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      );
    },
    child: const Text(
      "info message",
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        letterSpacing: .5,
      ),
    ),
  );
}