import 'package:flutter/material.dart';
import 'package:fruit_app/core/constants.dart/color_constans.dart';
import 'package:fruit_app/core/constants.dart/string_constans.dart';
import 'package:fruit_app/core/widgets/card_text.dart';
import 'package:kartal/kartal.dart';

final class CardImage extends StatelessWidget {
  const CardImage({
    required this.onPressed,
    required this.imageUrl,
    required this.saladPrice,
    required this.saladName,
    super.key,
  });
  final void Function()? onPressed;
  final String imageUrl;
  final String saladPrice;
  final String saladName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(0.4),
      height: context.dynamicHeight(0.3),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Card(
        elevation: 1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Center(
                child: Image.network(
                  imageUrl,
                  width: context.dynamicWidth(0.4),
                  height: context.dynamicHeight(0.3),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CardTextWidget(
              itemValue: saladName,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '$saladPrice TL',
                  style: const TextStyle(
                    color: ColorConstansts.sunShadeColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: StringConstants.fontBrandonGrotesqueRegular,
                  ),
                ),
                IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    Icons.add_circle_outlined,
                    color: ColorConstansts.sunShadeColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
