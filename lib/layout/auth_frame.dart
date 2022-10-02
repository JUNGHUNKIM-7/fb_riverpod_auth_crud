import "package:flutter/material.dart";
import 'package:go_mongo/providers/providers.dart';
import 'package:go_mongo/styles.dart';
import 'package:go_mongo/utils/extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/auth_component.dart';
import '../models/userbody.dart';
import '../utils/enums.dart';

class AuthFrame extends StatefulHookConsumerWidget with Styles {
  const AuthFrame({this.authLayoutType = AuthLayoutType.login, super.key});
  final AuthLayoutType authLayoutType;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthLayOutState();
}

class _AuthLayOutState extends ConsumerState<AuthFrame> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    final bool cond = widget.authLayoutType == AuthLayoutType.login;
    final bool? isValid = _formKey.currentState?.validate();
    final Userbody userBody = ref.watch(userBodyProvider);

    return Padding(
      padding: widget.kPaddingWidth20,
      child: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(maxHeight: size.height),
          child: Column(
            children: [
              const Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cond
                        ? Text(
                            "login".toTitleCase(),
                            style: tt.headline1,
                          )
                        : Text(
                            "sign in".toTitleCase(),
                            style: tt.headline1,
                          ),
                    widget.kSizedHeight15,
                    cond
                        ? Text(
                            "don't you have an account? register".toTitleCase(),
                            style: tt.subtitle1,
                          )
                        : Text(
                            "you have an account? login".toTitleCase(),
                            style: tt.subtitle1,
                          ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              cond
                  ? LoginForm(formkey: _formKey)
                  : SignInForm(formkey: _formKey),
              const Spacer(flex: 2),
              cond
                  ? Container(
                      constraints: BoxConstraints(maxWidth: size.width * .5),
                      child: SubmitButton(
                        authLayoutType: AuthLayoutType.login,
                        icon: const Icon(Icons.login),
                        buttonText: "start".toTitleCase(),
                        userBody: userBody,
                        isValid: isValid,
                      ),
                    )
                  : Container(
                      constraints: BoxConstraints(maxWidth: size.width * .5),
                      child: SubmitButton(
                        authLayoutType: AuthLayoutType.create,
                        icon: const Icon(Icons.ac_unit_outlined),
                        buttonText: "register".toTitleCase(),
                        userBody: userBody,
                        isValid: isValid,
                      ),
                    ),
              const Spacer(flex: 2)
            ],
          ),
        ),
      ),
    );
  }
}
