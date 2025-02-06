import 'package:chat_app/controller/declare_controller.dart';
import 'package:chat_app/services/fire%20store/fire_store.dart';
import 'package:flutter/material.dart';
import '../../../model/user_profile_model.dart';
import '../../../utiitsl/my_color.dart';

Card editUiMethod({
  required String text,
  required IconData icon,
  required bool isEditButton,
  required BuildContext context,
  required UserProfileModel user,
  required String edit,
  required var controller,
}) {
  return Card(
    color: primaryColor,
    child: ListTile(
      title: Text(
        text,
        style: const TextStyle(color: Colors.white70),
      ),
      leading: Icon(
        icon,
        color: Colors.white70,
      ),
      trailing: (isEditButton)
          ? IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: bgColor,
                    title: const Text(
                      "Edit",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5,
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            hintText: text,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white70,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white70,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                           FireStore.fireStore.editUser(
                            userEmail: user.email.toString(),
                            edit: edit,
                            editMessage:
                                settingsController.txtEditUserInfo.text,
                          );
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white70,
              ),
            )
          : null,
    ),
  );
}
