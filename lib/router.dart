import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/pages/pages.dart';
import 'package:kenryo_tankyu/pages/teacher/search_teacher.dart';
import 'package:kenryo_tankyu/providers/providers.dart';

final navigationKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routesProvider = Provider<GoRouter>((ref) {
  final authStateAsync = ref.watch(authStateChangesProvider);
  final redirection = authStateAsync.valueOrNull != null ? '/home' : '/login';

  return GoRouter(
    initialLocation: redirection,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) =>
        const SettingsPage(),
      ),
      GoRoute(
        path: '/result',
        builder: (context, state) =>
            ResultPageRoute(beforeSearched: state.extra as Searched),
        routes: [
          GoRoute(
            path: 'pdfExpand',
            builder: (context, state) =>
                PdfExpandPage(searched: state.extra as Searched),
          ),
        ],
      ),
      GoRoute(
        path: '/krgp',
        builder: (context, state) =>
            const KrgpPage(),
      ),
      GoRoute(
          path: '/teacher',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SubjectSelectPage()),
          routes: <RouteBase>[
            GoRoute(path: 'search',
            builder: (context, state) =>
            const SearchTeacher()),
            GoRoute(
                path: 'select',
                builder: (context, state) =>
                    TeacherSelectPage(subjectNumber: state.extra as int),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'showPdf',
                    builder: (context, state) =>
                        const ShowTeacherPdfPage(),
                  ),
                ]),
          ]),

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
        builder: (context, state) => const SearchPage(),
      ),

      //ShellRoute内にBottomNavigationBarで遷移する画面を記載する
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        //BottomNavigationBarを実装しているページを記載する
        //childでScaffoldのbodyを渡す
        builder: (context, state, child) => Footer(child: child),
        routes: <RouteBase>[
          //BottomNavigationBarから遷移するページを記載する
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: HomePage(key: state.pageKey)),
          ),
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
            path: '/testSelect',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: TestSelectPage(key: state.pageKey)),
            routes: <RouteBase>[
              GoRoute(
                  path: 'mitsuki',
                  builder: (context, state) => const TestForMitsuki()),
              GoRoute(
                  path: 'coji',
                  builder: (context, state) => const TestForCoji()),
              GoRoute(
                  path: 'aoi', builder: (context, state) => const TestForAoi()),
            ],
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(body: Center(child: Text(state.error.toString()))),
    ),
  );
});
