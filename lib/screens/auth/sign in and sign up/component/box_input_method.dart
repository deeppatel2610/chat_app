import 'package:chat_app/controller/declare_controller.dart';
import 'package:chat_app/model/chat_model.dart';
import 'package:chat_app/services/Auth/auth.dart';
import 'package:chat_app/services/fire%20store/fire_store.dart';
import 'package:chat_app/utiitsl/my_color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_icon_button/animate_change_icon.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Card boxInputMethod({
  required String text,
  required IconData icon,
  required bool isIcon,
  required bool isEmail,
  required TextEditingController controller,
  required bool isBgColor,
  required bool isPassword,
}) {
  return Card(
    color: (isBgColor) ? primaryColor : bgColor,
    child: Obx(
      () => TextField(
        controller: controller,
        readOnly: signInAndSignUpController.isTemp.value,
        obscureText:
            (isEmail) ? false : signInAndSignUpController.isPassword.value,
        style: const TextStyle(color: Colors.white, fontSize: 18, height: 2),
        decoration: InputDecoration(
          hintText: text,
          hintStyle:
              const TextStyle(color: Colors.white54, fontSize: 18, height: 2),
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
          suffixIcon: (isPassword)
              ? (isIcon)
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8, top: 12),
                      child: AnimateChangeIcon(
                        animateDuration: const Duration(milliseconds: 600),
                        rotateBeginAngle: 5,
                        onTap: () {
                          signInAndSignUpController.passwordHiding();
                        },
                        firstIcon: const Icon(
                          Icons.visibility_off,
                          color: Colors.white60,
                        ),
                        secondIcon: const Icon(
                          Icons.visibility,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                      width: 0,
                    )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await sendImageController.imagePicker();
                        ChatModel chat = ChatModel(
                          message: chatController.txtMassage.text,
                          time: Timestamp.now(),
                          receiver: chatController.receiverEmail.value,
                          sender: Auth.auth.currentUser()!.email,
                          isImage: true,
                          userImage: settingsController.profileImage,
                          image: sendImageController.url,
                        );
                        await FireStore.fireStore.addChatInFireStore(chat);
                      },
                      icon: const Icon(
                        Icons.image_outlined,
                        color: Colors.white60,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        ChatModel chat = ChatModel(
                          message: chatController.txtMassage.text,
                          time: Timestamp.now(),
                          receiver: chatController.receiverEmail.value,
                          sender: Auth.auth.currentUser()!.email,
                          isImage: false,
                          userImage: settingsController.profileImage,
                          image: "",
                        );
                        await FireStore.fireStore.addChatInFireStore(chat);
                        chatController.txtMassage.clear();
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
          border: InputBorder.none,
        ),
      ),
    ),
  );
}
