import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/admob/v1.dart';
import 'package:kenryo_tankyu/service/firestore_service.dart';

import '../../components/components.dart';
import '../../constant/constant.dart';
import '../../service/write_spread_sheet.dart';

class TestForAoi extends StatelessWidget {
  const TestForAoi({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(title: Text(firebaseAuth.currentUser!.displayName?? '')),
      body: const Center(child:WorkImageChip(searched: testSearchedValue1)),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  async{
          await firebaseAuth.currentUser?.updateDisplayName('aa');
        },
      ),
    );
  }
}
