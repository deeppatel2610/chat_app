import 'package:chat_app/services/Auth/auth.dart';
import 'package:flutter/material.dart';
import '../../../model/chat_model.dart';
import '../../../utiitsl/my_color.dart';

Widget senderAndReceiverMessageBox({
  required List<ChatModel> chat,
  required int index,
  required borderRadius,
}) {
  return Row(
    mainAxisAlignment: (Auth.auth.currentUser()!.email == chat[index].sender)
        ? MainAxisAlignment.end
        : MainAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: borderRadius,
        ),
        alignment: (Auth.auth.currentUser()!.email == chat[index].sender)
            ? Alignment.topRight
            : Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                (Auth.auth.currentUser()!.email == chat[index].sender)
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
            children: <Widget>[
              chat[index].isImage
                  ? SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(chat[index].image!),
                    )
                  : SizedBox(
                      child: Text(
                        chat[index].message!,
                        style: const TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '''${(chat[index].time.toDate().hour > 12) ? (chat[index].time.toDate().hour % 12).toString().padLeft(2, '0') : (chat[index].time.toDate().hour).toString().padLeft(2, '0')} : ${chat[index].time.toDate().minute.toString().padLeft(2, '0')}''',
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white60,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    (chat[index].time.toDate().hour <= 12) ? ('AM') : ('PM'),
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white60,
                      fontSize: 11,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ],
  );
}
