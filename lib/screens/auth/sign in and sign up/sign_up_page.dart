import 'package:chat_app/screens/auth/sign%20in%20and%20sign%20up/sign_in_page.dart';
import 'package:chat_app/screens/home%20page/home_page.dart';
import 'package:chat_app/services/fire%20store/fire_store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/declare_controller.dart';
import '../../../utiitsl/my_color.dart';
import '../../floating bottom bar/floating_bottom_bar.dart';
import 'component/box_input_method.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Container(
              height: 470,
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white10,
                    spreadRadius: .5,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        letterSpacing: .5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    boxInputMethod(
                      text: "User Id",
                      icon: Icons.person_2_outlined,
                      isIcon: false,
                      isEmail: true,
                      controller: signInAndSignUpController.txtUserId,
                      isBgColor: false,
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    boxInputMethod(
                      text: "Name",
                      icon: Icons.drive_file_rename_outline,
                      isIcon: false,
                      isEmail: true,
                      isPassword: true,
                      isBgColor: false,
                      controller: signInAndSignUpController.txtName,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    boxInputMethod(
                      text: "Email",
                      isBgColor: false,
                      icon: Icons.email_outlined,
                      isIcon: false,
                      isEmail: true,
                      controller: signInAndSignUpController.txtEmail,
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    boxInputMethod(
                      isBgColor: false,
                      isPassword: true,
                      text: "password",
                      icon: Icons.lock_outlined,
                      isIcon: true,
                      isEmail: false,
                      controller: signInAndSignUpController.txtPassword,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        signInAndSignUpController.createAccount(
                          email: signInAndSignUpController.txtEmail.text,
                          password: signInAndSignUpController.txtPassword.text,
                        );
                        if (signInAndSignUpController.txtEmail.text != "" &&
                            signInAndSignUpController.txtPassword.text != "") {
                          await FireStore.fireStore.insertUserFireStore(
                            email: signInAndSignUpController.txtEmail.text,
                            name: signInAndSignUpController.txtName.text,
                            userId: signInAndSignUpController.txtUserId.text,
                            userImage: settingsController.profileImage,
                            isOnline: true,
                          );
                          await Get.to(
                            const SignInPage(),
                            transition: Transition.fadeIn,
                            duration: const Duration(milliseconds: 600),
                          );
                          signInAndSignUpController.txtUserId.clear();
                          signInAndSignUpController.txtName.clear();
                          signInAndSignUpController.txtEmail.clear();
                          signInAndSignUpController.txtPassword.clear();
                        }
                      },
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xff9010ef),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: .5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Stack(
                      children: [
                        Divider(
                          endIndent: 200,
                        ),
                        Divider(
                          indent: 200,
                        ),
                      ],
                    ),
                    const Text(
                      "Or",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: -1,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'you are member? ',
                          style: TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              const SignInPage(),
                              transition: Transition.fadeIn,
                              duration: const Duration(milliseconds: 600),
                            );
                          },
                          child: const Text(
                            "Log In now",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
