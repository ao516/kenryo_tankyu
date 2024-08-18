import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/service/firestore_service.dart';

class TestForAoi extends StatelessWidget {
  const TestForAoi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('やることー\nデザイン（さきさんが送ってくれたの参考に\npdfのパッケージ変える\n検索結果並び変え\n')),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  async{
          await FireStoreService.instance.create();
          debugPrint('create');
        },
      ),
    );
  }
}
