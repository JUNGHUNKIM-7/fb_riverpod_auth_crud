import 'package:flutter/material.dart';
import 'package:go_mongo/utils/enums.dart';
import 'package:go_mongo/utils/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

mixin Styles {
  SizedBox get kSizedHeight30 => const SizedBox(height: 30);
  SizedBox get kSizedWidth30 => const SizedBox(width: 30);
  SizedBox get kSizedHeight15 => const SizedBox(height: 15);
  SizedBox get kSizedWidth15 => const SizedBox(width: 15);
  EdgeInsets get kPaddingWidth20 => const EdgeInsets.symmetric(horizontal: 20);
  EdgeInsets get kPaddingHeight20 => const EdgeInsets.symmetric(vertical: 20);

  // Color get _kDarkPrimary => Colors.red;
  // Color get _kLightSecondary => Colors.red;
  // Color get _kDarkSecondary => Colors.red;
  Color get _kLightFont => Colors.black87;
  Color get _kDarkFont => Colors.grey;

  TextStyle get _kLightHeader => GoogleFonts.lato(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: _kLightFont,
      );
  TextStyle get _kDarkHeader => GoogleFonts.lato(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: _kDarkFont,
      );
  TextStyle get _kLightSubHeader => GoogleFonts.lato(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: _kLightFont,
      );
  TextStyle get _kDarkSubHeader => GoogleFonts.lato(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: _kDarkFont,
      );
  TextStyle get _kLightParagraph => GoogleFonts.lato(
        fontSize: 16,
        color: _kLightFont,
      );
  TextStyle get _kDarkParagraph => GoogleFonts.lato(
        fontSize: 16,
        color: _kDarkFont,
      );
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> kGetSnackBar({
    required BuildContext context,
    required String text,
    required SnackBarType snackBarType,
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(text.toTitleCase()),
          backgroundColor:
              snackBarType == SnackBarType.success ? Colors.green : Colors.red,
        ),
      );
}

class StylesContainer with Styles {
  StylesContainer._({
    required bool isDark,
  }) : _isDark = isDark;

  late bool _isDark;

  factory StylesContainer.getTheme([bool isDark = false]) =>
      StylesContainer._(isDark: isDark);

  ColorScheme get _colorScheme =>
      _isDark ? const ColorScheme.dark() : const ColorScheme.light();

  TextStyle get _kHeader => _isDark ? _kDarkHeader : _kLightHeader;
  TextStyle get _kSubHeader => _isDark ? _kDarkSubHeader : _kLightSubHeader;
  TextStyle get _kParagraph => _isDark ? _kDarkParagraph : _kLightParagraph;

  MaterialStateProperty<Color> get _backgroundCol => _isDark
      ? MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.red;
          } else if (states.contains(MaterialState.hovered)) {
            return Colors.red;
          } else {
            return Colors.red;
          }
        })
      : MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.green;
          } else if (states.contains(MaterialState.hovered)) {
            return Colors.green;
          } else {
            return Colors.green;
          }
        });

  ThemeData get kThemeData => ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: _backgroundCol,
          ),
        ),
        textTheme: TextTheme(
          headline1: _kHeader,
          subtitle1: _kSubHeader,
          bodyText1: _kParagraph,
        ),
        useMaterial3: true,
        colorScheme: _colorScheme,
      );
}
