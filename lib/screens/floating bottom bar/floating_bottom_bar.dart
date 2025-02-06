import 'package:chat_app/utiitsl/my_color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/declare_controller.dart';

class FloatingBottomBar extends StatelessWidget {
  const FloatingBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Obx(
        () => floatingBottomBarController
            .screensLiat[floatingBottomBarController.screensIndex.value],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.transparent,
        color: primaryColor,
        items: const <Widget>[
          Icon(
            Icons.sms_outlined,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.update_outlined,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.call_end_outlined,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.settings_outlined,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          floatingBottomBarController.changeIndex(index: index);
        },
      ),
    );
  }
}
