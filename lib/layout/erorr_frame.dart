import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorFrame extends ConsumerWidget {
  const ErrorFrame({Key? key, required this.error, this.stackTrace})
      : super(key: key);

  final Object error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(error.toString()),
        Text(stackTrace.toString()),
      ],
    );
  }
}
