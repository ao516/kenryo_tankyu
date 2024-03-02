import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///TODO あまり納得いってないよこのタブ
///あと、riverpod使わずにstateful使っちゃってるのちょっと罪悪感あるし！

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade300, borderRadius: BorderRadius.circular(25.0)),
            child: Expanded(
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.red,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  _Tab(label: '虚無虚無プリン', icon: const Icon(Icons.favorite)),
                  _Tab(label: '閲覧履歴', icon: const Icon(Icons.history)),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Text('aaa'),
          Text('bbb')
        ], //TODO,, tabcontrollerがindexを管理してくれているから、順番に作っちゃうだけでおけ
      ),
    );
  }

  Widget _Tab({required String label, required Icon icon}) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 8.0),
          Text(label),
        ],
      ),
    );
  }
}
