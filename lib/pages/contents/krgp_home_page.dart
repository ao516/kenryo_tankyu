import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/constant/constant.dart';

class KrgpPage extends StatelessWidget {
  const KrgpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KRGPグランプリ優秀作品')),
      body: Center(
        child: Column(
          children: [
            const Text('ここでは過去のKRGPグランプリの優秀作品を閲覧できます。'),
            Expanded(
              child: ListView.separated(
                itemCount: krgpYearList.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(krgpYearList[index]),
                    onTap: () {
                      context.push(
                        '/krgp/year',extra: krgpYearList[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ), //todo
      ),
    );
  }
}
