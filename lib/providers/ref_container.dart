import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/enums.dart';
import 'providers.dart';

class StateNotifierContainer<T, U> {
  final WidgetRef _ref;
  final StateNotifierType _refTypes;
  late final dynamic _reader;
  late final dynamic _watcher;

  StateNotifierContainer({
    required WidgetRef ref,
    StateNotifierType refTypes = StateNotifierType.darkMode,
  })  : _ref = ref,
        _refTypes = refTypes {
    switch (_refTypes) {
      case StateNotifierType.darkMode:
        _reader = _ref.read(darkModeProvider.notifier);
        _watcher = _ref.watch(darkModeProvider);
        break;
    }
  }

  T get reader => _reader;
  U get watcher => _watcher;
}

StateNotifierContainer<T, U> getRef<T, U>({
  required WidgetRef ref,
  StateNotifierType stateNotifierType = StateNotifierType.darkMode,
}) =>
    StateNotifierContainer<T, U>(ref: ref, refTypes: stateNotifierType);
