import 'package:chat_app/controller/declare_controller.dart';
import 'package:chat_app/model/chat_model.dart';
import 'package:chat_app/screens/auth/sign%20in%20and%20sign%20up/component/box_input_method.dart';
import 'package:chat_app/services/Auth/auth.dart';
import 'package:chat_app/services/fire%20store/fire_store.dart';
import 'package:chat_app/utiitsl/my_color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'component/pop_menu_method.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("deep");

    FireStore.fireStore.editOnlineAndOffline(
        email: Auth.auth.currentUser()!.email.toString(), isOnline: true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("deep patel");
    FireStore.fireStore.editOnlineAndOffline(
        email: Auth.auth.currentUser()!.email.toString(), isOnline: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(chatController.image.value),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              chatController.receiverName.value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: .5,
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: FireStore.fireStore.readChatFromFireStore(
          Auth.auth.currentUser()!.email.toString(),
          chatController.receiverEmail.value,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<QueryDocumentSnapshot<Map<String, dynamic>>> data =
              snapshot.data!.docs;
          List chatData = data
              .map(
                (e) => e.data(),
              )
              .toList();
          List docIdList = data
              .map(
                (e) => e.id,
              )
              .toList();

          List<ChatModel> chat = chatData
              .map(
                (e) => ChatModel.fromMap(e),
              )
              .toList();

          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...List.generate(
                          chat.length,
                          (index) => popMenuMethod(
                            chat,
                            index,
                            docIdList,
                            context,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: boxInputMethod(
                  text: "massage",
                  icon: Icons.emoji_emotions_outlined,
                  isIcon: false,
                  isEmail: true,
                  isBgColor: true,
                  controller: chatController.txtMassage,
                  isPassword: false,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
