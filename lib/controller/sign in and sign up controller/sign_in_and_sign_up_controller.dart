import 'package:chat_app/controller/declare_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/Auth/auth.dart';

class SignInAndSignUpController extends GetxController {
  RxBool isPassword = true.obs;
  RxBool isTemp = false.obs;
  var txtEmail = TextEditingController();
  var txtName = TextEditingController();
  var txtPassword = TextEditingController();
  var txtUserId = TextEditingController();

  void passwordHiding() {
    isPassword.value = !isPassword.value;
    update();
  }

  void createAccount({required String email, required String password}) {
    Auth.auth.createAccountWithEmailAndPassword(email, password);
  }

  Future<String?> signInAccount({
    required String email,
    required String password,
  }) {
    return Auth.auth.signInWithEmailAndPassword(email, password);
  }
}
