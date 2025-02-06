import 'package:chat_app/controller/declare_controller.dart';
import 'package:chat_app/screens/settings%20page/profile_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/user_profile_model.dart';
import '../../services/fire store/fire_store.dart';
import '../../utiitsl/my_color.dart';
import '../all page use components/app_bar_method.dart';
import 'component/settings_view_method.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBarMethod(
        text: 'Settings',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FutureBuilder(
              future: FireStore.fireStore.readUserFireStore(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.hasError.toString());
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  Map<String, dynamic>? mapData = snapshot.data!.data();
                  UserProfileModel data = UserProfileModel.fromMap(mapData!);
                  return Card(
                    color: primaryColor,
                    child: ListTile(
                      title: Text(
                        data.name.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .5,
                        ),
                      ),
                      subtitle: Text(
                        data.email.toString(),
                        style: const TextStyle(
                          color: Colors.white60,
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          data.userImage!,
                        ),
                        radius: 25,
                      ),
                      trailing: Hero(
                        tag: 'tag-1',
                        child: IconButton(
                          onPressed: () {
                            Get.to(
                              const ProfileEditPage(),
                              duration: const Duration(
                                milliseconds: 600,
                              ),
                              transition: Transition.fadeIn,
                            );
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
            settingsViewMethod(),
          ],
        ),
      ),
    );
  }
}
