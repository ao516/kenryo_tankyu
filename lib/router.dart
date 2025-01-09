import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/pages/pages.dart';
import 'package:kenryo_tankyu/providers/providers.dart';

final navigationKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routesProvider = Provider<GoRouter>((ref) {
  final authStateAsync = ref.watch(authStateChangesProvider);
  final redirection = authStateAsync.hasValue
      ? authStateAsync.value == null
          ? '/welcome'
          : authStateAsync.value!.emailVerified == false
              ? '/verify_email'
              : '/home'
      : '/welcome';
  // const redirection = '/home';
  return GoRouter(
    initialLocation: redirection,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
          path: '/welcome',
          builder: (context, state) => const WelcomePage(),
          routes: [
            GoRoute(
                path: 'verify_name',
                builder: (context, state) => const VerifyNamePage(),
                routes: [
                  GoRoute(
                    path: 'create_password',
                    builder: (context, state) => const CreatePassWordPage(),
                  ),
                ]),
            GoRoute(
                path: 'login',
                builder: (context, state) => const LoginPage(),
                routes: [
                  GoRoute(
                    path: 'reset_password',
                    builder: (context, state) => const ResetPasswordPage(),
                  )
                ]),
          ]),
      GoRoute(
        path: '/verify_email',
        builder: (context, state) => const CheckEmailPage(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationPage(),
      ),
      GoRoute(
        path: '/result/:documentID',
        builder: (context, state) {
          final documentID = state.pathParameters['documentID']!;
          return ResultPage(documentID: int.parse(documentID));
        },
      ),
      GoRoute(
        path: '/krgp',
        builder: (context, state) => const KrgpPage(),
        routes: [
          GoRoute(
            path: 'year',
            builder: (context, state) =>
                KrgpYearPage(year: state.extra as String),
          ),
        ],
      ),
      GoRoute(
          path: '/teacher',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: TeacherSelectPage()),
          routes: <RouteBase>[
            GoRoute(
              path: 'showPdf',
              builder: (context, state) => const ShowTeacherPdfPage(),
            ),
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
