import 'package:chat_app/screens/home%20page/home_page.dart';
import 'package:chat_app/screens/status%20page/status_page.dart';
import 'package:chat_app/screens/voice%20and%20video%20call/voice_and_video_call.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/settings page/settings_page.dart';
import '../declare_controller.dart';

class FloatingBottomBarController extends GetxController {
  RxList<Widget> screensLiat = <Widget>[
    const HomePage(),
    const StatusPage(),
    const VoiceAndVideoCall(),
    const SettingsPage(),
  ].obs;

  RxInt screensIndex = 0.obs;

  void changeIndex({required int index}) {
    screensIndex.value = index;
  }
}
