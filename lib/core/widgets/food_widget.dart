import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/card_text.dart';
import 'package:fruit_app/core/widgets/subt_text_content.dart';
import 'package:kartal/kartal.dart';

import '../constants.dart/color_constans.dart';

class FoodWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  const FoodWidget(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      alignment: Alignment.center,
      height: context.dynamicHeight(0.5),
      width: context.dynamicWidth(0.4),
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              width: context.dynamicWidth(0.3),
              height: context.dynamicHeight(0.15),
              fit: BoxFit.fill,
            ),
            CardTextWidget(itemValue: title),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubTextWidget(
                    itemValue: '$price TL', color: ColorConstansts.iconColor),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_circle_outlined,
                    color: ColorConstansts.sunShadeColor,
                  ),
                ),
              ],
            ),
          ],
        )
      ]),
    );
  }
}
