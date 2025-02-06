import 'package:chat_app/controller/declare_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  var txtMassage = TextEditingController();
  var txtMassageEdit = TextEditingController();
  RxString receiverName = "".obs;
  RxString receiverEmail = "".obs;
  RxString image = settingsController.profileImage.obs;

  void getReceiver(String name, String email) {
    receiverName.value = name;
    receiverEmail.value = email;
  }

  void storeImage(String userImage) {
    image.value = userImage;
  }
}
