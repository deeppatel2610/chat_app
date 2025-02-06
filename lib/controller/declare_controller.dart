import 'package:chat_app/controller/chat%20controller/chat_controller.dart';
import 'package:chat_app/controller/floating%20bottom%20bar%20controller/floating_bottom_bar_controller.dart';
import 'package:chat_app/controller/send%20image%20controller/send_image_controller.dart';
import 'package:chat_app/controller/settings%20controller/settings_controller.dart';
import 'package:chat_app/controller/sign%20in%20and%20sign%20up%20controller/sign_in_and_sign_up_controller.dart';
import 'package:get/get.dart';

var signInAndSignUpController = Get.put(
  SignInAndSignUpController(),
);
var floatingBottomBarController = Get.put(
  FloatingBottomBarController(),
);
var settingsController = Get.put(
  SettingsController(),
);
var chatController = Get.put(
  ChatController(),
);
var sendImageController = Get.put(
  SendImageController(),
);
