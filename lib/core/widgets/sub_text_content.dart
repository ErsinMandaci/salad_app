import 'package:flutter/material.dart';
import 'package:fruit_app/core/constants.dart/string_constans.dart';
import 'package:kartal/kartal.dart';

final class SubTextWidget extends StatelessWidget {
  const SubTextWidget({super.key, required this.itemValue, required this.color, this.fontSize});
  final double? fontSize;
  final Color color;
  final String itemValue;
  @override
  Widget build(BuildContext context) {
    return Text(
      itemValue,
      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w400,
        fontFamily: StringConstants.fontBrandonGrotesqueRegular,
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
