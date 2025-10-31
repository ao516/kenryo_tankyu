import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/core/constants/const.dart';
import 'package:kenryo_tankyu/features/content/presentation/presentation.dart';
import 'package:kenryo_tankyu/features/search/presentation/presentation.dart';
import 'package:kenryo_tankyu/features/search/data/algolia_provider.dart';


class HomePage extends ConsumerWidget {
  static HomePage builder(BuildContext context, GoRouterState state) =>
      const HomePage();
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileName = developer_mode ? 'ゲスト' : FirebaseAuth.instance.currentUser?.displayName ?? 'ゲスト';
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('ようこそ、${profileName}さん'),
                IconButton(
                    onPressed: () => context.push('/settings'),
                    icon: const Icon(Icons.settings)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('今日のあなたに',
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
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, stackTrace) => Text('Error: $error'),
                    data: (data) {
                      return Column(
                        children: [
                          Card(
                            child: ResultPreviewContent(
                              searched: data[0],
                              forLibrary: false,
                            ),
                          ),
                          Card(
                            child: ResultPreviewContent(
                              searched: data[1],
                              forLibrary: false,
                            ),
                          ),
                        ],
                      );
                    });
              },
            ),
            const SizedBox(height: 16),
            const Text('コンテンツ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const ContentCarousel(),
            const SizedBox(height: 16),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const Text('お知らせ',
            //         style:
            //             TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            //     TextButton(
            //       onPressed: () => context.push('/notifications'),
            //       style: TextButton.styleFrom(
            //           side: const BorderSide(color: Colors.grey)),
            //       child: const Text('もっと見る'),
            //     )
            //   ],
            // ),
            // const SizedBox(height: 8),
            // Card(
            //   margin: EdgeInsets.symmetric(horizontal: 8.0),
            //   child: SizedBox(
            //     height: 400,
            //     child: NotificationList(notifications: [testNotificationValue]),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

// now let's test on android emulator
