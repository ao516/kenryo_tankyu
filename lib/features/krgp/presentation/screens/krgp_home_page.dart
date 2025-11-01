import 'package:flutter/material.dart';

class KrgpPage extends StatelessWidget {
  const KrgpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KRGPグランプリ優秀作品')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('ここでは過去のKRGPグランプリの優秀作品を閲覧できます。'),
            Text('今後のアップデートをお待ちください！'),
            // Expanded(
            //   child: ListView.separated(
            //     itemCount: krgpYearList.length,
            //     separatorBuilder: (context, index) => const Divider(),
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         title: Text(krgpYearList[index]),
            //         onTap: () {
            //           context.push(
            //             '/krgp/year',extra: krgpYearList[index]);
            //         },
            //       );
            //     },
            //   ),
            // ),
          ],
        ), //todo
      ),
    );
  }
}
