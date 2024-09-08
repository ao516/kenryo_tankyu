import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/service/firestore_service.dart';

import '../../components/components.dart';
import '../../constant/constant.dart';

class TestForAoi extends StatelessWidget {
  const TestForAoi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child:WorkImageChip(searched: testSearchedValue1)),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  async{
          await FireStoreService.instance.create();
          debugPrint('create');
        },
      ),
    );
  }
}
