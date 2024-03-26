import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/pages/pages.dart';
import 'package:kenryo_tankyu/providers/auth_provider.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:kenryo_tankyu/test_page.dart';

final navigationKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routesProvider = Provider<GoRouter>((ref) {
 final authStateAsync = ref.watch(authStateChangesProvider);
 final redirection = authStateAsync.valueOrNull != null ? '/home' : '/login';
 return GoRouter(
   initialLocation: redirection, ///本番用
   navigatorKey: _rootNavigatorKey,
   routes: [
     GoRoute(
       path: '/login',
       builder: (context,state) => const LoginPage(),
     ),
     // GoRoute(
     //   path: '/test',
     //   builder: (context, state) => const TestPage(),
     // ),
     GoRoute(
       path: '/result',
       builder: (context, state) =>ResultPage(beforeSearched: state.extra as Searched),
     ),
     GoRoute(
       path: '/resultList',
       builder: (context, state) => ResultListPage(),
     ),
     GoRoute(
       path: '/subCategory',
       builder: (context, state) => const SubCategorySelectPage(),
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
         GoRoute(
           path: '/test',
           pageBuilder: (context, state) =>
               NoTransitionPage(child: TestPage(key: state.pageKey)),
         ),
       ],
     ),
   ],
 );
});
