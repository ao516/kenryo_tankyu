import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/firebase_options.dart';
import 'package:kenryo_tankyu/router.dart';
import 'package:kenryo_tankyu/service/service.dart';
import 'package:kenryo_tankyu/theme.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const ProviderScope(child: MainApp()));
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('Handling a background message ${message.messageId}');
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {

  @override
  void initState() {
    super.initState();
    _loadThemeMode();
  }
  @override
  Widget build(BuildContext context) {
    final routerConfig = ref.watch(routesProvider);
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routerConfig,
      themeMode: themeMode,
      darkTheme: ThemeData(useMaterial3: true, colorScheme: MaterialTheme.darkScheme()),
      theme: ThemeData(useMaterial3: true, colorScheme: MaterialTheme.lightScheme(),
      ),
    );
  }

  void _loadThemeMode() async{
   final themeMode = await ThemePreferences().loadThemeMode();
    ref.read(themeModeProvider.notifier).state = themeMode;
  }
}
