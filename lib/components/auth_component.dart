import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_mongo/styles.dart';
import 'package:go_mongo/utils/enums.dart';
import 'package:go_mongo/utils/extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../models/userbody.dart';
import '../providers/providers.dart';
import '../utils/types.dart';

class LoginForm extends StatefulHookConsumerWidget with Styles {
  const LoginForm({Key? key, required GlobalKey<FormState> formkey})
      : _formKey = formkey,
        super(key: key);
  final GlobalKey<FormState> _formKey;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final controllers = <TextEditingController>[
      useTextEditingController(),
      useTextEditingController(),
    ];

    return Form(
      key: widget._formKey,
      onChanged: () => ref.read(userBodyProvider.notifier).state = Userbody(
        email: controllers.first.value.text.toLowerCase().trim(),
        password: controllers.last.value.text.trim(),
      ),
      child: Column(
        children: [
          TFormField(
            authInputType: AuthInputType.email,
            controller: controllers.first,
          ),
          widget.kSizedHeight30,
          TFormField(
            authInputType: AuthInputType.password,
            controller: controllers.last,
          ),
        ],
      ),
    );
  }
}

class SignInForm extends StatefulHookConsumerWidget with Styles {
  const SignInForm({Key? key, required GlobalKey<FormState> formkey})
      : _formKey = formkey,
        super(key: key);
  final GlobalKey<FormState> _formKey;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
  @override
  Widget build(BuildContext context) {
    final controllers = <TextEditingController>[
      useTextEditingController(),
      useTextEditingController(),
      useTextEditingController(),
      useTextEditingController(),
    ];

    return Form(
      key: widget._formKey,
      onChanged: () => ref.read(userBodyProvider.notifier).state = Userbody(
        email: controllers.first.value.text.toLowerCase().trim(),
        password: controllers[1].value.text.trim(),
        name: controllers[2].value.text.toLowerCase().trim(),
        addr: controllers.last.value.text.toTitleCase().trim(),
      ),
      child: Column(
        children: [
          TFormField(
            authInputType: AuthInputType.email,
            controller: controllers.first,
          ),
          widget.kSizedHeight30,
          TFormField(
            authInputType: AuthInputType.password,
            controller: controllers[1],
          ),
          widget.kSizedHeight30,
          TFormField(
            authInputType: AuthInputType.name,
            controller: controllers[2],
          ),
          widget.kSizedHeight30,
          TFormField(
            authInputType: AuthInputType.address,
            controller: controllers.last,
          ),
        ],
      ),
    );
  }
}

class TFormField extends StatefulHookConsumerWidget {
  const TFormField({
    required this.authInputType,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final AuthInputType authInputType;
  final TextEditingController controller;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TFormFieldState();
}

class _TFormFieldState extends ConsumerState<TFormField> {
  @override
  Widget build(BuildContext context) {
    final li = _getElems(widget.authInputType);

    return TextFormField(
      validator: (String? value) => _getValidator(widget.authInputType, value),
      controller: widget.controller,
      autocorrect: false,
      autofocus: false,
      obscureText:
          widget.authInputType == AuthInputType.password ? true : false,
      keyboardType: li[1] as TextInputType,
      decoration: InputDecoration(
        label: Text((li.first as String).toTitleCase()),
        hintText: (li.first as String).toTitleCase(),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
      ),
    );
  }

  List _getElems(AuthInputType authInputType) {
    switch (authInputType) {
      case AuthInputType.email:
        return ["email", TextInputType.emailAddress];
      case AuthInputType.password:
        return ["password", TextInputType.visiblePassword];
      case AuthInputType.name:
        return ["name", TextInputType.name];
      case AuthInputType.address:
        return ["address", TextInputType.streetAddress];
    }
  }

  String? _getValidator(AuthInputType authInputType, String? value) {
    String? isEmp(String? val) =>
        val!.isNotEmpty ? null : "value cant be empty".toTitleCase();

    String? validEmail(String? val) =>
        val!.contains('@') ? null : "invalid email type".toTitleCase();

    String? length8(String? val) => val!.length >= 8
        ? null
        : "password length should be more 8 chars".toTitleCase();

    String? isValid(String? val, AuthInputType authInputType) {
      String? err;

      switch (authInputType) {
        case AuthInputType.email:
          err = isEmp(val);
          if (err != null) {
            return err;
          }
          err = validEmail(val);
          if (err != null) {
            return err;
          }
          return null;
        case AuthInputType.password:
          err = isEmp(val);
          if (err != null) {
            return err;
          }
          err = length8(val);
          if (err != null) {
            return err;
          }
          return null;
        case AuthInputType.name:
          err = isEmp(val);
          if (err != null) {
            return err;
          }
          return null;
        case AuthInputType.address:
          err = isEmp(val);
          if (err != null) {
            return err;
          }
          return null;
      }
    }

    switch (authInputType) {
      case AuthInputType.email:
        return isValid(value, authInputType);
      case AuthInputType.password:
        return isValid(value, authInputType);
      case AuthInputType.name:
        return isValid(value, authInputType);
      case AuthInputType.address:
        return isValid(value, authInputType);
      default:
        return null;
    }
  }
}

class SubmitButton extends HookConsumerWidget with Styles {
  const SubmitButton({
    Key? key,
    required this.authLayoutType,
    required this.buttonText,
    required this.icon,
    this.navigationKey,
    this.userBody,
    this.isValid,
  }) : super(key: key);

  final AuthLayoutType authLayoutType;
  final String buttonText;
  final Icon icon;
  final Userbody? userBody;
  final bool? isValid;
  final GlobalKey<NavigatorState>? navigationKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async => await _futureCallback(
        context,
        authLayoutType: authLayoutType,
        ref: ref,
      )(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(
            width: 10,
          ),
          Text(
            buttonText.toUpperCase(),
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }

  FutureVoidCallback _futureCallback(
    BuildContext context, {
    required AuthLayoutType authLayoutType,
    required WidgetRef ref,
  }) {
    final auth = ref.watch(authProvider);
    final loadingState = ref.read(loadingProvider.notifier);

    FutureVoid helper(FutureVoidCallback func, String success) async {
      context.loaderOverlay.show();
      loadingState.state = context.loaderOverlay.visible;

      try {
        await func().whenComplete(() {
          context.loaderOverlay.hide();
          loadingState.state = context.loaderOverlay.visible;
          kGetSnackBar(
            context: context,
            text: success,
            snackBarType: SnackBarType.success,
          );
        });
      } on FirebaseException catch (e) {
        kGetSnackBar(
          context: context,
          text: e.message.toString(),
          snackBarType: SnackBarType.failed,
        );
      }
    }

    switch (authLayoutType) {
      case AuthLayoutType.create:
        return () async {
          if (isValid != null && isValid!) {
            await helper(
              () async => await auth.signup(),
              "created user",
            );
          } else {
            kGetSnackBar(
              context: context,
              text: "fialed to create user",
              snackBarType: SnackBarType.failed,
            );
          }
        };
      case AuthLayoutType.login:
        return () async {
          if (isValid != null && isValid!) {
            await helper(
              () async => await auth.signin(),
              "created user",
            );
          } else {
            kGetSnackBar(
              context: context,
              text: "failed to create user",
              snackBarType: SnackBarType.failed,
            );
          }
        };
      case AuthLayoutType.logout:
        return () async => await helper(
              () async => await auth.signout(),
              "logout user",
            );
      default:
        throw Error();
    }
  }
}
