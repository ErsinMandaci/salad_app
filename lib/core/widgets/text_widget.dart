import 'package:flutter/material.dart';
import 'package:fruit_app/core/constants.dart/string_constans.dart';
import 'package:kartal/kartal.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key, required this.itemValue, required this.color, this.fontSize});
  final Color color;
  final String itemValue;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      itemValue,
      style: context.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w500,
        fontFamily: StringConstants.fontBrandonGrotesqueRegular,
        color: color,
        fontSize: fontSize ?? context.textTheme.titleLarge?.fontSize,
      ),
    );
  }
}
