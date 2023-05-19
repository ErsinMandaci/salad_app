import 'package:flutter/material.dart';
import 'package:fruit_app/core/constants.dart/color_constans.dart';
import 'package:kartal/kartal.dart';

import '../constants.dart/string_constans.dart';

class CardTextWidget extends StatelessWidget {
  const CardTextWidget(
      {super.key, required this.itemValue});

  final String itemValue;

  @override
  Widget build(BuildContext context) {
    return Text(
      itemValue,
      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w500,
        fontFamily: StringConstants.fontBrandonGrotesqueRegular,
        color: ColorConstansts.textContentColor,
      ),
    );
  }
}
