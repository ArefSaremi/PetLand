import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/cart/presentation/controllers/cart_controller.dart';
import 'package:flutter_application_2/core/constants/colors.dart';
import 'package:flutter_application_2/core/utils/number_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import '../../../constants/text_style.dart';

class BuyButtonWidget extends GetView<CartController> {
  final int productid;
  final VoidCallback buyButtonFunction;
  final bool isInBasket;
  static void _defaultFunction() {}
  const BuyButtonWidget({
    super.key,
    required this.productid,
    this.buyButtonFunction = _defaultFunction,
    this.isInBasket = false,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          controller.quantity(productid).value > 0
              ? reduceOrAddButton()
              : isInBasket
              ? Container()
              : buyButton(),
    );
  }

  SizedBox buyButton() {
    return SizedBox(
      width: double.maxFinite,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: red),
        onPressed: () => controller.addProduct('$productid'),
        child: Text('خرید', style: buyTS),
      ),
    );
  }

  SizedBox reduceOrAddButton() {
    return SizedBox(
      width: double.maxFinite,
      height: 50.h,
      child: ElevatedButton(
        onPressed: null,
        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(red)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            controller.quantity(productid).value == 1
                ? deleteButton()
                : reduceButton(),
            addButton(),
            Text(
              '${persianNumberFormatter(controller.quantity(productid).value)} عدد',
              style: buyTS,
            ),
          ],
        ),
      ),
    );
  }

  IconButton addButton() {
    return IconButton(
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(yellow)),
      icon: Transform.scale(scale: 2, child: Icon(Icons.add, color: red)),
      onPressed: () {
        controller.addProduct('$productid');
        buyButtonFunction();
      },
    );
  }

  IconButton reduceButton() {
    return IconButton(
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(yellow)),
      icon: Transform.scale(scale: 2, child: Icon(Icons.remove, color: red)),
      onPressed: () {
        controller.reduceProduct('$productid');
        buyButtonFunction();
      },
    );
  }

  IconButton deleteButton() {
    return IconButton(
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(yellow)),
      icon: Transform.scale(scale: 2, child: Icon(Icons.delete, color: red)),
      onPressed: () {
        controller.reduceProduct('$productid');
        buyButtonFunction();
      },
    );
  }
}
