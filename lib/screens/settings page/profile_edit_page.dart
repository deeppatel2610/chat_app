import 'package:chat_app/model/user_profile_model.dart';
import 'package:chat_app/screens/auth/sign%20in%20and%20sign%20up/sign_in_page.dart';
import 'package:chat_app/services/Auth/auth.dart';
import 'package:chat_app/services/fire%20store/fire_store.dart';
import 'package:chat_app/utiitsl/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/declare_controller.dart';
import 'component/edit_ui_method.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        backgroundColor: primaryColor,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: FutureBuilder(
        future: FireStore.fireStore.readUserFireStore(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.hasError.toString());
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            Map<String, dynamic>? mapData = snapshot.data!.data();
            UserProfileModel data = UserProfileModel.fromMap(mapData!);
            settingsController.userData = data;
            return Hero(
              tag: 'tag-1',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            await sendImageController.imagePicker();
                            FireStore.fireStore.editUser(
                              userEmail:
                                  Auth.auth.currentUser()!.email.toString(),
                              edit: "userImage",
                              editMessage: sendImageController.url,
                            );
                          },
                          child: CircleAvatar(
                            radius: 80,
                            backgroundImage: NetworkImage(data.userImage!),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      editUiMethod(
                        context: context,
                        text: data.userId.toString(),
                        icon: Icons.assignment_ind_outlined,
                        isEditButton: true,
                        user: data,
                        edit: 'userId',
                        controller: settingsController.txtEditUserInfo,
                      ),
                      editUiMethod(
                        context: context,
                        text: data.name.toString(),
                        icon: Icons.person_2_outlined,
                        isEditButton: true,
                        user: data,
                        edit: 'name',
                        controller: settingsController.txtEditUserInfo,
                      ),
                      editUiMethod(
                        context: context,
                        text: data.email.toString(),
                        icon: Icons.email_outlined,
                        isEditButton: false,
                        user: data,
                        edit: 'userId',
                        controller: settingsController.txtEditUserInfo,
                      ),
                      editUiMethod(
                        text: "phone",
                        icon: Icons.phone,
                        isEditButton: false,
                        context: context,
                        user: data,
                        edit: 'userId',
                        controller: settingsController.txtEditUserInfo,
                      ),
                      GestureDetector(
                        onTap: () {
                          Auth.auth.signOut();
                          floatingBottomBarController.screensIndex.value = 0;
                          Get.offAll(
                            const SignInPage(),
                            duration: const Duration(milliseconds: 600),
                            transition: Transition.fadeIn,
                          );
                        },
                        child: editUiMethod(
                          text: "signOut",
                          icon: Icons.exit_to_app_outlined,
                          isEditButton: false,
                          context: context,
                          user: data,
                          edit: 'userId',
                          controller: settingsController.txtEditUserInfo,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
