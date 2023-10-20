import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_app/core/constants.dart/color_constans.dart';
import 'package:fruit_app/core/constants.dart/string_constans.dart';
import 'package:fruit_app/core/enums.dart/image_constants.dart';
import 'package:fruit_app/core/widgets/card_image.dart';
import 'package:fruit_app/core/widgets/text_widget.dart';
import 'package:fruit_app/features/view/view_basket/basket_view.dart';
import 'package:fruit_app/features/riverpod/fruit_provider.dart';
import 'package:fruit_app/features/view/view_order/order_view.dart';
import 'package:kartal/kartal.dart';

final class HomeView extends ConsumerStatefulWidget {
  final String? authName;
  const HomeView({super.key, required this.authName});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(fruitProvider.notifier).fetchSalad());
  }

  @override
  Widget build(BuildContext context) {
    final saladList = ref.watch(fruitProvider).salad;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const _AppBarTitle(),
      ),
      body: ref.watch(fruitProvider).isLoading ?? true
          ? const Center(
              child: CircularProgressIndicator(color: ColorConstansts.iconColor),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: context.paddingLow,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HomeAuthText(widget: widget),
                    const SizedBox(height: 20),
                    const _HomeSearchTextField(),
                    const SizedBox(height: 30),
                    const TextWidget(
                      itemValue: StringConstants.recoText,
                      color: ColorConstansts.iconColor,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 1,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        final allList = saladList?[index];
                        return CardImage(
                          onPressed: () {},
                          imageUrl: allList?.imageUrl ?? '',
                          saladName: allList?.name ?? '',
                          saladPrice: allList?.price.toString() ?? '',
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    const TextWidget(
                      itemValue: 'All Salad',
                      color: ColorConstansts.iconColor,
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      height: context.dynamicHeight(0.2),
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: saladList?.length,
                        itemBuilder: (context, index) {
                          var allList = saladList?[index];

                          return CardImage(
                              onPressed: () {
                                ref.read(fruitProvider.notifier).selectedSalad(allList!);
                                ref.read(fruitProvider.notifier).addBasket(allList);
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute<BasketView>(
                                      builder: (context) => const BasketView(),
                                    ));
                              },
                              imageUrl: allList?.imageUrl ?? '',
                              saladName: allList?.name ?? '',
                              saladPrice: allList?.price.toString() ?? '');
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_sharp,
            color: ColorConstansts.iconColor,
          ),
          iconSize: 30,
        ),
        Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<OrderView>(
                      builder: (context) => const OrderView(),
                    ));
              },
              child: Image.asset(
                ImageConstants.basketIcon.toPng,
              ),
            ),
            const Text(
              'My Basket',
              style: TextStyle(color: Colors.black, fontSize: 10),
            ),
          ],
        ),
      ],
    );
  }
}

class _HomeSearchTextField extends StatelessWidget {
  const _HomeSearchTextField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: const TextField(
        style: TextStyle(color: Colors.black, fontSize: 20),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search_sharp,
            color: Colors.grey,
          ),
          hintText: 'Serach for fruit salad combos',
        ),
      ),
    );
  }
}

class _HomeAuthText extends StatelessWidget {
  const _HomeAuthText({
    required this.widget,
  });

  final HomeView widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: context.onlyTopPaddingNormal.top,
          left: context.onlyLeftPaddingLow.left,
          right: context.onlyRightPaddingHigh.right * 1.7),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
              color: ColorConstansts.textContentColor,
              fontSize: 20,
              fontFamily: StringConstants.fontBrandonGrotesqueRegular),
          children: [
            TextSpan(
              text: 'Hello ${widget.authName}',
              style: const TextStyle(color: ColorConstansts.textContentColor, fontSize: 17),
            ),
            const TextSpan(
              text: StringConstants.homeText,
            ),
          ],
        ),
      ),
    );
  }
}
