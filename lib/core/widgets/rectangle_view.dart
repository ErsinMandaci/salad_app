import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../constants.dart/color_constans.dart';

class ImageContainer extends StatelessWidget {
  final String imageName;
  final String imageName2;
  final String imageName3;
  const ImageContainer({super.key, required this.imageName,required this.imageName2,required this.imageName3});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstansts.sunShadeColor,
      width: context.width,
      height: 469,
      child: Stack(
        children: [
          Positioned(
            left: 35,
            right: 39,
            top: 80,
            bottom: 120,
            child: Image.asset(imageName),
          ),
          Positioned(
            bottom: 350,
            left: 290,
            child: Image.asset(imageName2),
          ),
          Positioned(
            bottom: 342,
            left: 282,
            child: Image.asset(imageName3),
          ),
        ],
      ),
    );
  }
}
