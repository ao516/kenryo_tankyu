import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/service/algolia_provider.dart';

import '../components/components.dart';

class HomePage extends ConsumerWidget {
  static HomePage builder(BuildContext context, GoRouterState state) =>
      const HomePage();
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileName = FirebaseAuth.instance.currentUser?.displayName ?? 'ゲスト';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('ようこそ、$profileNameさん'),
                IconButton(
                    onPressed: () => context.push('/settings'),
                    icon: const Icon(Icons.settings)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('ランダムにあなたにおすすめ😊',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                IconButton(
                    onPressed: () {
                      ref.read(forceRefreshProvider.notifier).state = true;
                      ref.invalidate(randomAlgoliaSearchProvider);
                    },
                    icon: const Icon(Icons.refresh)),
              ],
            ),
            Consumer(
              builder: (context, ref, child) {
                final asyncValue = ref.watch(randomAlgoliaSearchProvider);
                return asyncValue.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) => Text('Error: $error'),
                  data: (data) {
                    if (data == null) {
                      return const Text('No data');
                    } else {
                      return Column(
                        children: [
                          Card(
                            child:ResultPreviewContent(searched: data[0], forLibrary: false,),
                          ),
                          Card(
                            child:ResultPreviewContent(searched: data[1], forLibrary: false,),
                          ),
                        ],
                      );

                    }
                  },
                );
              },
            ),
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
    );
  }
}

// now let's test on android emulator
