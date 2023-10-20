import 'package:flutter/material.dart';
import 'package:fruit_app/core/constants.dart/color_constans.dart';

import 'package:fruit_app/core/constants.dart/string_constans.dart';

@immutable
final class AppTheme {
  const AppTheme(this.context);

  final BuildContext context;

  ThemeData get theme => ThemeData.light().copyWith(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: StringConstants.fontBrandonGrotesqueRegular,
          ),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: ColorConstansts.sunShadeColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom().copyWith(
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            backgroundColor: const MaterialStatePropertyAll<Color>(
              ColorConstansts.sunShadeColor,
            ),
            foregroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      );
}
