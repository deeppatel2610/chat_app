import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  /// default image
  String profileImage =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';

  /// title list
  List<String> settingsTitleLiat = [
    "Account",
    "Privacy",
    "Avatar",
    "Lists",
    "Chats",
    "Notifications",
    "Storage and data",
    "App language",
    "Help",
    "Invite a friend",
    "App updates",
  ];

  /// icon list
  List<IconData> settingsIconLiat = [
    Icons.key_outlined,
    Icons.lock_outline,
    Icons.face_outlined,
    Icons.switch_account_outlined,
    Icons.sms_outlined,
    Icons.notifications_none_outlined,
    Icons.data_saver_off_outlined,
    Icons.language_outlined,
    Icons.help_outline,
    Icons.group,
    Icons.phone_iphone_outlined,
  ];

  var userData;

  var txtEditUserInfo = TextEditingController();
}
