import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../components/components.dart';
import '../constant/constant.dart';
import '../providers/providers.dart';

class HomePage extends ConsumerWidget {
  static HomePage builder(BuildContext context, GoRouterState state) =>
      const HomePage();
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(authStateChangesProvider);
    final user = authStateAsync.value;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      user == null
                          ? const Text('ようこそ、ゲストさん')
                          : Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(user.photoURL!),
                                ),
                                const SizedBox(width: 8),
                                Text('ようこそ、${user.displayName}さん'),
                              ],
                            ),
                      IconButton(
                          onPressed: () => context.push('/settings'),
                          icon: const Icon(Icons.settings)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('あなたへのおすすめ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Card(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      child:
                          ResultPreviewContent(searched: testSearchedValue1)),
                  const SizedBox(height: 8),
                  const Card(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      child:
                          ResultPreviewContent(searched: testSearchedValue2)),
                  const SizedBox(height: 16),
                  const Text('コンテンツ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const ContentCarousel(),
                  const SizedBox(height: 16),
                  const Text('お知らせ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Card(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      height: 400,
                      child: NotificationList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text('第77回 縣陵祭 楽しんでいってください！',style: TextStyle(fontWeight: FontWeight.bold)),
                  Image.asset('assets/images/kenryo_fes.png', height: 130),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// now let's test on android emulator
