import 'package:chat_app/screens/home%20page/component/pop%20menu%20items%20component/delete_message_method.dart';
import 'package:chat_app/screens/home%20page/component/pop%20menu%20items%20component/edit_message_method.dart';
import 'package:chat_app/screens/home%20page/component/pop%20menu%20items%20component/info_message_method.dart';
import 'package:flutter/cupertino.dart';
import '../../../model/chat_model.dart';
import 'chats_box.dart';

CupertinoContextMenu popMenuMethod(
  List<ChatModel> chat,
  int index,
  List docIdList,
  BuildContext context,
) {
  return CupertinoContextMenu(
    actions: [
      deleteMessageMethod(
        chat,
        index,
        docIdList,
      ),
      editMessageMethod(
        chat,
        index,
        context,
        docIdList,
      ),
      infoMessageMethod(
        context,
        index,
        chat,
      ),
    ],
    child: chatsBox(chat, index),
  );
}
