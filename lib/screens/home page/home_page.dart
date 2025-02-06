import 'package:chat_app/model/user_profile_model.dart';
import 'package:chat_app/screens/all%20page%20use%20components/app_bar_method.dart';
import 'package:chat_app/services/Auth/auth.dart';
import 'package:chat_app/services/fire%20store/fire_store.dart';
import 'package:chat_app/utiitsl/my_color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/declare_controller.dart';
import 'component/show_user_method.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBarMethod(
        text: "Message",
      ),
      body: StreamBuilder(
        stream: FireStore.fireStore.readAllUserFireStore(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.hasError.toString());
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<QueryDocumentSnapshot<Map<String, dynamic>>> data =
              snapshot.data!.docs;
          List userData = data
              .map(
                (e) => e.data(),
              )
              .toList();
          List<UserProfileModel> users = userData
              .map(
                (e) => UserProfileModel.fromMap(e),
              )
              .toList();
          User? currentUser = Auth.auth.currentUser();
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) => Card(
                color: primaryColor,
                child: GestureDetector(
                  onTap: () {
                    chatController.getReceiver(
                      users[index].name!,
                      users[index].email!,
                    );
                    chatController.storeImage(users[index].userImage!);
                    Get.toNamed("/chatPage");
                  },
                  child: showUserMethod(
                    currentUser: currentUser,
                    users: users,
                    index: index,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
