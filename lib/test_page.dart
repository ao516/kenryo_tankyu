import 'dart:async';

import 'package:flutter/material.dart';
import 'package:algolia/algolia.dart';
import 'data/algolia/algolia.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Future<String>? _future;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            setState(() {
              _future = _fetchData();
            });
          }, child: const Text('「ふる」を検索')),
          FutureBuilder<String>(future: _future, builder: (BuildContext context, AsyncSnapshot<String> snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const CircularProgressIndicator();
            }
            if(snapshot.hasError){
              return Text('Error: ${snapshot.error}');
            }
            return Text('Data: ${snapshot.data}');
          }),
        ],
      ),
    );
  }

  Future<String> _fetchData() async {
    final AlgoliaQuery algoliaQuery = Application.algolia.instance.index('firestore').query('ふる');
    final AlgoliaQuerySnapshot snap = await algoliaQuery.getObjects();
    final List<AlgoliaObjectSnapshot> objects = snap.hits;
    return objects.toString();
  }
}
