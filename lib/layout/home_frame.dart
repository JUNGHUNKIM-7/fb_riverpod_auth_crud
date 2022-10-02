import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/auth_component.dart';
import '../components/crud_component.dart';
import '../providers/providers.dart';
import '../providers/ref_container.dart';
import '../providers/state_notifiers.dart';
import '../utils/enums.dart';

class HomeFrame extends ConsumerWidget {
  const HomeFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).currUser;
    final isDark = getRef<DarkModeNotifier, bool>(
        ref: ref, stateNotifierType: StateNotifierType.darkMode);

    return Column(
      children: [
        Text('${user?.email}'),
        const SubmitButton(
          authLayoutType: AuthLayoutType.logout,
          buttonText: 'logout',
          icon: Icon(Icons.logout),
        ),
        const CrudButton(
          crudButtonType: CrudButtonType.create,
          collType: CollTypes.user,
        ),
        const CrudButton(
          crudButtonType: CrudButtonType.update,
          collType: CollTypes.user,
        ),
        const CrudButton(
          crudButtonType: CrudButtonType.delete,
          collType: CollTypes.user,
        ),
        ElevatedButton(
          onPressed: () => isDark.reader.toggle(),
          child: isDark.watcher
              ? const Icon(Icons.sunny)
              : const Icon(Icons.dark_mode),
        ),
      ],
    );
  }
}
