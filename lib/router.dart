import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:kenryo_tankyu/pages/pages.dart';
import 'package:kenryo_tankyu/test_page.dart';

final navigationKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routesProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateChangesProvider);

  final redirection = authState.valueOrNull != null ? '/home' : '/login';

  return GoRouter(
    ///最初に開かれる画面の設定
    initialLocation: redirection, ///本番用
    // initialLocation: '/test', ///練習用
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/login',
        builder: LoginPage.builder,
      ),
      // GoRoute(
      //   path: '/test',
      //   builder: (context, state) => const TestPage(),
      // ),
      GoRoute(
        path: '/result',
        builder: (context, state) => const ResultPage(),
      ),
      GoRoute(
        path: '/resultList',
        builder: (context, state) => ResultListPage(state.extra as String),
      ),
      GoRoute(
        path: '/subCategory',
        builder: (context, state) => SubCategorySelectPage(state.extra as int),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => SearchPage(),
      ),

      //ShellRoute内にBottomNavigationBarで遷移する画面を記載する
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        //BottomNavigationBarを実装しているページを記載する
        //childでScaffoldのbodyを渡す
        builder: (context, state, child) => Footer(
          child: child,
        ),
        routes: <RouteBase>[
          //BottomNavigationBarから遷移するページを記載する
          GoRoute(
              path: '/home',
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: HomePage(key: state.pageKey)),
              //Page1から遷移するページを記載する
              routes: <RouteBase>[
                GoRoute(
                  path: 'contents',
                  builder: (context, state) =>
                      const ContentsPage(), //TODO 移動したい画面に変えてね。
                ),
              ]),
          //BottomNavigationBarから遷移するページを記載する
          GoRoute(
            path: '/explore',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: ExplorePage(key: state.pageKey)),
          ),
          GoRoute(
            path: '/library',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: LibraryPage(key: state.pageKey)),
          ),
        ],
      ),
    ],
  );
});
