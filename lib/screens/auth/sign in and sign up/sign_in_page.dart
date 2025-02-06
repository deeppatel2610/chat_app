import 'package:chat_app/controller/declare_controller.dart';
import 'package:chat_app/screens/auth/sign%20in%20and%20sign%20up/sign_up_page.dart';
import 'package:chat_app/services/Auth/auth.dart';
import 'package:chat_app/services/Auth/google_auth.dart';
import 'package:chat_app/services/fire%20store/fire_store.dart';
import 'package:chat_app/utiitsl/my_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../floating bottom bar/floating_bottom_bar.dart';
import 'component/box_input_method.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
                      "Login",
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
                      text: "Email",
                      icon: Icons.email_outlined,
                      isIcon: false,
                      isEmail: true,
                      controller: signInAndSignUpController.txtEmail,
                      isBgColor: false,
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    boxInputMethod(
                      text: "password",
                      icon: Icons.lock_outlined,
                      isIcon: true,
                      isEmail: false,
                      isPassword: true,
                      controller: signInAndSignUpController.txtPassword,
                      isBgColor: false,
                    ),
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Forgot password? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () async {
                        String? error =
                            await signInAndSignUpController.signInAccount(
                          email: signInAndSignUpController.txtEmail.text,
                          password: signInAndSignUpController.txtPassword.text,
                        );
                        if (error == "error") {
                          Get.snackbar(
                            "incorrect email and password!",
                            "please enter the correct email and password!",
                          );
                        } else {
                          User? user = Auth.auth.currentUser();
                          if (user != null) {
                            Get.offAll(
                              const FloatingBottomBar(),
                              duration: const Duration(milliseconds: 600),
                              transition: Transition.fadeIn,
                            );
                            //123@gmail.com
                            //123456789
                            signInAndSignUpController.txtEmail.clear();
                            signInAndSignUpController.txtPassword.clear();
                          } else {
                            Get.snackbar("error", user!.toString());
                          }
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
                          "LOGIN",
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
                      height: 20,
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
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await GoogleAuth.googleAuth.signInWithGoogle();

                            User? user = Auth.auth.currentUser();
                            if (user != null) {
                              await FireStore.fireStore.insertUserFireStore(
                                email: user.email.toString(),
                                name: user.displayName.toString(),
                                userId: user.phoneNumber.toString(),
                                userImage: settingsController.profileImage,
                                isOnline: true
                              );
                              await Get.offAll(
                                const FloatingBottomBar(),
                                duration: const Duration(milliseconds: 600),
                                transition: Transition.fadeIn,
                              );
                            } else {
                              Get.snackbar("error", user!.toString());
                            }
                          },
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(googleIconImage),
                          ),
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(facebookIconImage),
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(appleIconImage),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Not a member? ',
                          style: TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              const SignUpPage(),
                              transition: Transition.fadeIn,
                              duration: const Duration(milliseconds: 600),
                            );
                          },
                          child: const Text(
                            "Sign up now",
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

/// image var
String googleIconImage =
    'https://static.vecteezy.com/system/resources/previews/022/613/027/non_2x/google-icon-logo-symbol-free-png.png';
String facebookIconImage =
    'https://static.vecteezy.com/system/resources/previews/012/660/856/non_2x/facebook-logo-on-transparent-isolated-background-free-vector.jpg';
String appleIconImage =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFa-ZEmjHFcQSx3HMDkP5_lziPQzDfvs_klQ&s";
