import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/firebase_options.dart';
import 'package:kenryo_tankyu/router.dart';
import 'package:kenryo_tankyu/theme.dart';
import 'package:kenryo_tankyu/service/service.dart';
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
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        if (lightDynamic != null && darkDynamic != null) {
          lightColorScheme = lightDynamic.harmonized();
          darkColorScheme = darkDynamic.harmonized();
        }
        else {
          lightColorScheme =  MaterialTheme.lightScheme();
          darkColorScheme = MaterialTheme.darkScheme();
        }

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: routerConfig,
          themeMode: themeMode,
          darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
          theme: ThemeData(useMaterial3: true, colorScheme:lightColorScheme,
          ),
        );
      }
    );
  }

  void _loadThemeMode() async{
   final themeMode = await ThemePreferences().loadThemeMode();
    ref.read(themeModeProvider.notifier).state = themeMode;
  }
}
