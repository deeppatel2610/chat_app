import 'package:chat_app/controller/declare_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utiitsl/my_color.dart';

AppBar appBarMethod({
  required String text,
}) {
  return AppBar(
    backgroundColor: primaryColor,
    title: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
    ),
  );
}
