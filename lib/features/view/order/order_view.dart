import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_app/core/constants.dart/color_constans.dart';
import 'package:fruit_app/core/widgets/subt_text_content.dart';
import 'package:fruit_app/core/widgets/text_widget.dart';
import 'package:kartal/kartal.dart';

import '../../riverpod/fruit_provider.dart';

class OrderView extends ConsumerWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final basketList = ref.watch(fruitProvider).basketList;
    final orderList = ref.watch(fruitProvider).orderList;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        title: const Center(
          child: Text('My Basket'),
        ),
      ),
      body: basketList == null || basketList.isEmpty
          ? const Center(
              child: TextWidget(
                  color: ColorConstansts.iconColor,
                  itemValue: 'Henüz ürün eklemediniz'),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: basketList.toSet().length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        onDismissed: (DismissDirection direction) {
                          orderList?.removeAt(index);
                        },
                        key: ValueKey<int?>(basketList[index].id),
                        child: Card(
                          margin: context.paddingLow,
                          elevation: 5,
                          child: SizedBox(
                            height: context.dynamicHeight(0.1),
                            child: ListTile(
                              contentPadding: context.paddingLow,
                              leading: Image.network(
                                  basketList[index].imageUrl ?? 'Not image'),
                              title: TextWidget(
                                fontSize: 16,
                                itemValue: basketList[index].name ?? '',
                                color: ColorConstansts.textContentColor,
                              ),
                              subtitle: SubTextWidget(
                                fontSize: 14,
                                itemValue: basketList.length.toString(),
                                color: Colors.black,
                              ),
                              trailing: TextWidget(
                                fontSize: 16,
                                itemValue: ref
                                    .read(fruitProvider.notifier)
                                    .totalPrice
                                    .toString(),
                                color: ColorConstansts.textContentColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: context.paddingMedium,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const SubTextWidget(
                              itemValue: 'Total', color: Colors.black),
                          TextWidget(
                              itemValue: ref
                                  .read(fruitProvider.notifier)
                                  .orderTotolPrice(),
                              color: ColorConstansts.textContentColor),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                            context.dynamicWidth(0.4),
                            context.dynamicHeight(0.08),
                          ),
                        ),
                        child: const Text('Checkout'),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
