import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/providers.dart';
import 'auth_frame.dart';
import 'erorr_frame.dart';
import 'home_frame.dart';

class AppBuilder extends StatelessWidget {
  const AppBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const AuthMain(),
    );
  }
}

class AuthMain extends ConsumerWidget {
  const AuthMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);

    return Scaffold(
      body: StreamBuilder(
        stream: auth.authChanges,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return const HomeFrame();
          } else if (snapshot.hasError) {
            return ErrorFrame(error: snapshot.error!);
          } else {
            return const AuthFrame();
          }
        }),
      ),
    );
  }
}
