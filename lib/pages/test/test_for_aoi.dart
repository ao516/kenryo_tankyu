import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/service/firestore_service.dart';

class TestForAoi extends StatelessWidget {
  const TestForAoi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('This is a test page for Aoi.')),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  async{
          await FireStoreService.instance.create();
          debugPrint('create');
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async{
      //     final fcmToken = await FirebaseMessaging.instance.getToken();
      //     FirebaseMessaging messaging = FirebaseMessaging.instance;
      //
      //     NotificationSettings settings = await messaging.requestPermission(
      //       alert: true,
      //       announcement: false,
      //       badge: true,
      //       carPlay: false,
      //       criticalAlert: false,
      //       provisional: false,
      //       sound: true,
      //     );
      //
      //     debugPrint('User granted permission: ${settings.authorizationStatus}');
      //     debugPrint('fcmToken: $fcmToken');
      //   },
      //   child: const Icon(Icons.arrow_back),
      // )
    );
  }
}
