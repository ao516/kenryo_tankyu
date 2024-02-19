import 'package:kenryo_tankyu/components/components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultListPage extends StatelessWidget {
  final String resultWord;
  const ResultListPage({Key? key, required this.resultWord}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
        onPopInvoked: (didPop) async => context.go('/home'), //TODO homeじゃだめ、使っていたボトムナビゲーションに戻りたい。
      child: Scaffold(
        appBar: ResultHeader(searchWord: resultWord),
        body:  SafeArea(
          child: Center(
            child: ElevatedButton(onPressed: ()=> context.push('/result'), child: const Text('結果リストなう。結果表示に進む。'),

            ),
          ),
        ),
      ),
    );
  }
}
