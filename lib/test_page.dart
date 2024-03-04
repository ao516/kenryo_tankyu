import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Page')
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: ()=> context.push('/home'), child: Text('rennshuu')),
          const Center(
            child: Text('Test Page'),
          ),
        ],
      ),
    );
  }
}
