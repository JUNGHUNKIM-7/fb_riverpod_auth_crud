import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_mongo/crud/crud.dart';
import 'package:go_mongo/providers/providers.dart';
import 'package:go_mongo/styles.dart';
import 'package:go_mongo/utils/enums.dart';
import 'package:go_mongo/utils/firebase_exception.dart';
import 'package:go_mongo/utils/types.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CrudButton extends ConsumerWidget with Styles {
  const CrudButton({
    Key? key,
    required this.crudButtonType,
    required this.collType,
  }) : super(key: key);

  final CollTypes collType;
  final CrudButtonType crudButtonType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () async => await _crudFunc(
          context,
          crudButtonType: crudButtonType,
          collTypes: collType,
          ref: ref,
        )(),
        child: _buttonProps(crudButtonType: crudButtonType),
      ),
    );
  }

  Text _buttonProps({required CrudButtonType crudButtonType}) {
    switch (crudButtonType) {
      case CrudButtonType.create:
        return const Text("create");
      case CrudButtonType.update:
        return const Text("update");
      case CrudButtonType.delete:
        return const Text("delete");
    }
  }

  FutureVoidCallback _crudFunc(
    BuildContext context, {
    required CrudButtonType crudButtonType,
    required CollTypes collTypes,
    required WidgetRef ref,
  }) {
    late Crud crud;

    if (collTypes == CollTypes.user) {
      crud = ref.watch(userCrudProvider);
    } else if (collTypes == CollTypes.post) {
      crud = ref.watch(postCrudProvider);
    }

    final loading = ref.watch(loadingProvider.notifier);

    FutureVoid helper(FutureVoidCallback func, String success) async {
      context.loaderOverlay.show();
      loading.state = context.loaderOverlay.visible;

      try {
        await func().whenComplete(
          () {
            context.loaderOverlay.hide();
            loading.state = context.loaderOverlay.visible;
            kGetSnackBar(
              context: context,
              text: 'creating post',
              snackBarType: SnackBarType.success,
            );
          },
        );
      } on FirebaseException catch (e) {
        kGetSnackBar(
          context: context,
          text: e.message.toString(),
          snackBarType: SnackBarType.failed,
        );
      }
    }

    switch (crudButtonType) {
      case CrudButtonType.create:
        return () async => await runOrExeption(
              () async =>
                  await helper(() => crud.insertDoc(), "insert"),
            );
      case CrudButtonType.update:
        return () async => await runOrExeption(
              () async =>
                  await helper(() => crud.insertDoc(), "updated"),
            );
      case CrudButtonType.delete:
        return () async => await runOrExeption(
              () async =>
                  await helper(() => crud.insertDoc(), "deleted"),
            );
    }
  }
}
