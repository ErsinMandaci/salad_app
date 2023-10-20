import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_app/core/constants.dart/color_constans.dart';
import 'package:fruit_app/core/constants.dart/string_constans.dart';
import 'package:fruit_app/features/riverpod/fruit_provider.dart';
import 'package:fruit_app/features/view/view_order/order_view.dart';
import 'package:kartal/kartal.dart';
import '../../../core/widgets/sub_text_content.dart';
import '../../../core/widgets/text_widget.dart';

final class BasketView extends ConsumerWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saladWatch = ref.watch(fruitProvider).selectedSalad;
    final addBasket = ref.watch(fruitProvider).basketList;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            addBasket?.clear();
            ref.read(fruitProvider.notifier).totalPrice = 0;
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: saladWatch?.length,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: context.dynamicHeight(0.2),
              color: ColorConstansts.sunShadeColor,
              child: Center(
                child: Image.network(
                  saladWatch?[index].imageUrl ?? '',
                  width: context.dynamicWidth(0.8),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: context.paddingNormal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                      itemValue: '${saladWatch?[index].name}',
                      color: ColorConstansts.iconColor,
                      fontSize: 32,
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      leading: SizedBox(
                        width: context.dynamicWidth(0.4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              iconSize: 32,
                              onPressed: () {
                                ref.read(fruitProvider.notifier).addBasket(saladWatch?[index]);
                              },
                              icon: const Icon(
                                Icons.add_circle_outline,
                              ),
                              color: ColorConstansts.sunShadeColor,
                            ),
                            TextWidget(
                              itemValue: (addBasket?.length).toString(),
                              color: ColorConstansts.iconColor,
                              fontSize: 24,
                            ),
                            IconButton(
                              iconSize: 32,
                              onPressed: () {
                                ref.watch(fruitProvider.notifier).removeBasket(saladWatch?[index]);
                              },
                              icon: const Icon(
                                Icons.remove_circle_outline,
                              ),
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      trailing: TextWidget(
                        itemValue: '${ref.watch(fruitProvider.notifier).totalPrice} TL',
                        color: ColorConstansts.iconColor,
                        fontSize: 24,
                      ),
                    ),
                    const Divider(
                      height: 100,
                      color: Colors.black,
                    ),
                    const TextWidget(
                      itemValue: 'One Pack Contains:',
                      color: ColorConstansts.iconColor,
                      fontSize: 24,
                    ),
                    SizedBox(
                      width: context.dynamicWidth(0.5),
                      child: const Divider(
                        thickness: 2,
                        color: ColorConstansts.sunShadeColor,
                      ),
                    ),
                    TextWidget(
                      itemValue: '${saladWatch?[index].description}',
                      color: ColorConstansts.textContentColor,
                      fontSize: 16,
                    ),
                    const Divider(
                      height: 30,
                      color: Colors.black,
                    ),
                    const SubTextWidget(
                      itemValue: StringConstants.basketSubTitle,
                      color: Colors.black,
                    ),
                    const Divider(
                      height: 40,
                    ),
                    const _CustomButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends ConsumerWidget {
  const _CustomButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: context.paddingLow,
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: () {
            // ref.read(fruitProvider.notifier).orderList(basketList?.first);
            Navigator.push(
                context,
                CupertinoPageRoute<OrderView>(
                  builder: (context) => const OrderView(),
                ));
          },
          child: const Text('Add to basket'),
        ),
      ),
    );
  }
}
