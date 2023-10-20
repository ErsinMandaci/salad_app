import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/enums.dart/image_constants.dart';
import 'package:fruit_app/core/widgets/rectangle_view.dart';
import 'package:fruit_app/features/view/view_home/home_view.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants.dart/color_constans.dart';
import '../../../core/constants.dart/string_constans.dart';
import '../../../core/widgets/text_widget.dart';

final class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _AuthImageContainer(),
            const _TextWidget(),
            const SizedBox(height: 25),
            _TextFormField(controller: controller),
            const SizedBox(height: 40),
            _AuthButton(controller: controller),
          ],
        ),
      ),
    );
  }
}

class _AuthImageContainer extends StatelessWidget {
  const _AuthImageContainer();

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      imageName: ImageConstants.authBasket.toPng,
      imageName2: ImageConstants.fruitDrops.toPng,
      imageName3: ImageConstants.ellipse.toPng,
    );
  }
}

class _AuthButton extends StatelessWidget {
  final TextEditingController controller;

  const _AuthButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: SizedBox(
        width: context.dynamicHeight(0.38),
        height: 56,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute<HomeView>(
                  builder: (context) => HomeView(authName: controller.text),
                ));
          },
          child: const Text(StringConstants.authButtonText),
        ),
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  const _TextWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: context.onlyTopPaddingNormal.top,
            left: context.onlyLeftPaddingMedium.left,
          ),
          child: const TextWidget(itemValue: StringConstants.authText, color: ColorConstansts.textContentColor),
        ),
      ],
    );
  }
}

class _TextFormField extends StatelessWidget {
  final TextEditingController controller;
  const _TextFormField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicHeight(0.38),
      color: ColorConstansts.textFormFieldColor,
      child: TextField(
        controller: controller,
        onChanged: (value) {},
        style: const TextStyle(color: Colors.black, fontSize: 20),
        decoration: const InputDecoration(
          hintText: 'Ersin',
        ),
      ),
    );
  }
}
