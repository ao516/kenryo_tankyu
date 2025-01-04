import 'package:flutter/material.dart';
import 'tests.dart';

class TestForAoi extends StatelessWidget {
  const TestForAoi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FirestoreUpload.uploadTestNotifications();
        },
      ),
    );
  }
}
