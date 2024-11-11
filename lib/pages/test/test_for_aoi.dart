import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/service/firestore_service.dart';


class TestForAoi extends StatelessWidget {
  const TestForAoi({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(title: Text(firebaseAuth.currentUser!.displayName ?? '')),
      body: Column(
        children: [


        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FireStoreService.instance.create();
        },
      ),
    );
  }
}
