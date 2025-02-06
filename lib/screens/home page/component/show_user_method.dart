import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../controller/declare_controller.dart';
import '../../../model/user_profile_model.dart';

ListTile showUserMethod({
  required User? currentUser,
  required List<UserProfileModel> users,
  required int index,
}) {
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: NetworkImage(users[index].userImage!),
    ),
    title: Text(
      (currentUser!.email != users[index].email)
          ? users[index].name.toString()
          : "${users[index].name}(You)",
      style: const TextStyle(
        fontSize: 17.5,
        fontWeight: FontWeight.w500,
        letterSpacing: .2,
        color: Colors.white,
      ),
    ),
    // subtitle: Text(
    //   users[index].email.toString(),
    //   style: const TextStyle(
    //     color: Colors.white54,
    //   ),
    // ),
    subtitle: Text(
      (users[index].isOnline) ? "online" : "offline",
      style: const TextStyle(
        color: Colors.white54,
      ),
    ),
  );
}
