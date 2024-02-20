import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.favorite),text: 'お気に入り'),
              Tab(icon: Icon(Icons.history),text: '閲覧履歴'),
            ],
          ),
          automaticallyImplyLeading: false, //戻るボタンの消去
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("お気に入りのリスト表示",style: TextStyle(fontSize: 20)),
            ),
            Center(
              child: Text("閲覧履歴のリスト表示",style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
