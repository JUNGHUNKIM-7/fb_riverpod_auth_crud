import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_mongo/providers/ref_container.dart';
import 'package:go_mongo/providers/state_notifiers.dart';
import 'package:go_mongo/styles.dart';
import 'package:go_mongo/utils/enums.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'layout/app_builder.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulHookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final isDark = getRef<DarkModeNotifier, bool>(
      ref: ref,
      stateNotifierType: StateNotifierType.darkMode,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: StylesContainer.getTheme().kThemeData,
      darkTheme: StylesContainer.getTheme(true).kThemeData,
      themeMode: isDark.watcher ? ThemeMode.dark : ThemeMode.light,
      home: const LoaderOverlay(
        overlayColor: Colors.black,
        overlayOpacity: 0.8,
        child: AppBuilder(),
      ),
    );
  }
}
