import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/constants.dart/color_constans.dart';
import 'package:fruit_app/core/enums.dart/png_constants.dart';
import 'package:fruit_app/core/widgets/rectangle_view.dart';
import 'package:fruit_app/core/widgets/subt_text_content.dart';
import 'package:fruit_app/core/widgets/text_widget.dart';
import 'package:fruit_app/features/view/auth/auth_view.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants.dart/string_constans.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const _CustomSplash(),
    );
  }
}

class _CustomSplash extends StatelessWidget {
  const _CustomSplash();

  @override
  Widget build(BuildContext context) {
    return const _BodyViewColumn();
  }
}

class _BodyViewColumn extends StatelessWidget {
  const _BodyViewColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageContainer(
          imageName: ImageConstants.fruitCartoon.toPng,
          imageName2: ImageConstants.fruitDrops.toPng,
          imageName3: ImageConstants.ellipse.toPng,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TextWidget(),
            _SubText(),
          ],
        ),
        const SizedBox(
          height: 60,
        ),
        const _CustomButton(),
      ],
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const AuthView(),
                ));
          },
          child: const Text(StringConstants.welcomeButtonText),
        ),
      ),
    );
  }
}

class _SubText extends StatelessWidget {
  const _SubText();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: context.paddingLow.top,
          left: context.onlyLeftPaddingNormal.left,
          right: context.onlyRightPaddingMedium.right),
      child: const SubTextWidget(
          itemValue: StringConstants.welcomeSubText,
          color: ColorConstansts.subTextContentColor),
    );
  }
}

class _TextWidget extends StatelessWidget {
  const _TextWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.onlyLeftPaddingNormal.left,
        context.paddingLow.top,
        context.onlyRightPaddingMedium.right,
        0,
      ),
      child: const TextWidget(
          itemValue: StringConstants.welcomeText,
          color: ColorConstansts.textContentColor),
    );
  }
}
