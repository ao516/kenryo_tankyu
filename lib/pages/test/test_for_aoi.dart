import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../components/components.dart';
import '../../constant/constant.dart';

class TestForAoi extends StatelessWidget {
  const TestForAoi({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(title: Text(firebaseAuth.currentUser!.displayName ?? '')),
      body: Column(
        children: [

          Center(child: WorkImageChip(searched: testSearchedValue1)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
      ),
    );
  }
}
