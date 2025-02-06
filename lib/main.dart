import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/screens/auth/sign%20in%20and%20sign%20up/sign_in_page.dart';
import 'package:chat_app/screens/auth/sign%20in%20and%20sign%20up/sign_up_page.dart';
import 'package:chat_app/screens/floating%20bottom%20bar/floating_bottom_bar.dart';
import 'package:chat_app/screens/home%20page/chat_page.dart';
import 'package:chat_app/screens/home%20page/home_page.dart';
import 'package:chat_app/screens/settings%20page/profile_edit_page.dart';
import 'package:chat_app/screens/settings%20page/settings_page.dart';
import 'package:chat_app/screens/status%20page/status_page.dart';
import 'package:chat_app/screens/voice%20and%20video%20call/voice_and_video_call.dart';
import 'package:chat_app/services/Auth/auth.dart';
import 'package:chat_app/online_and_offline.dart';
import 'package:chat_app/services/fire%20store/fire_store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ChatApp());
}

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("deep");
    FireStore.fireStore.editOnlineAndOffline(
      email: Auth.auth.currentUser()!.email.toString(),
      isOnline: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => (Auth.auth.currentUser() == null)
              ? const SignInPage()
              : const FloatingBottomBar(),
        ),
        GetPage(
          name: '/signUp',
          page: () => const SignUpPage(),
        ),
        GetPage(
          name: '/floatingBottomBar',
          page: () => const FloatingBottomBar(),
        ),
        GetPage(
          name: '/homePage',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/chatPage',
          page: () => const ChatPage(),
        ),
        GetPage(
          name: '/statusPage',
          page: () => const StatusPage(),
        ),
        GetPage(
          name: '/voiceAndVideoCall',
          page: () => const VoiceAndVideoCall(),
        ),
        GetPage(
          name: '/profilePage',
          page: () => const SettingsPage(),
        ),
        GetPage(
          name: '/profileEditPage',
          page: () => const ProfileEditPage(),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("deep");
    FireStore.fireStore.editOnlineAndOffline(
      email: Auth.auth.currentUser()!.email.toString(),
      isOnline: false,
    );
  }
}
