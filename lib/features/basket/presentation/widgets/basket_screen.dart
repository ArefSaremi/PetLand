import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/cart/presentation/widgets/buy_button_widget.dart';
import 'package:flutter_application_2/features/basket/presentation/controllers/basket_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/utils/number_formatter.dart';

class BasketScreen extends GetView<BasketController> {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: red,
        title: Text('سبد خرید', style: titleTS),
        centerTitle: true,
        backgroundColor: yellow,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.0.h),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_showProduct(), _buyConfirm()],
          ),
        ),
      ),
    );
  }

  InkWell _buyConfirm() {
    return InkWell(
      onTap: () async {
        controller.loadBasketItems();
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(color: red),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Text(
                      '${persianPriceFormatter(controller.totalPriceDouble.toInt())} تومان',
                      style: buyTS,
                    ),
                  ),
                ],
              ),
              Center(child: Text('ادامه خرید', style: buyTS)),
            ],
          ),
        ),
      ),
    );
  }

  Obx _showProduct() {
    return Obx(
      () => Expanded(
        child:
            controller.isCartEmpty.value
                ? Center(
                  child: Text('سبد خرید شما خالی است', style: showTitleTS),
                )
                : controller.products.isEmpty
                ? Center(child: CircularProgressIndicator(color: red))
                : ListView.separated(
                  itemCount: controller.products.length,
                  separatorBuilder:
                      (context, index) => Divider(color: black, height: 30.h),
                  itemBuilder: (context, index) {
                    var product = controller.products[index];
                    return SizedBox(
                      width: double.maxFinite,
                      height: 180.h,
                      child: InkWell(
                        onTap: () {
                          controller.goToProductDetails(index);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _image(product.image),
                            _product(
                              product.name,
                              product.description,
                              product.price.toInt(),
                              product.productId,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }

  Expanded _product(String name, String description, int price, int productId) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8.h,
            children: [
              Text(
                name,
                style: showTitleTS,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                description,
                style: normalTS,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text('${persianPriceFormatter(price)} تومان', style: priceTS),
              Spacer(),
              BuyButtonWidget(
                productid: productId,
                isInBasket: true,
                buyButtonFunction: () {
                  //for get data after add or reduse
                  controller.getFromStorage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _image(String image) {
    return Container(
      color: white,
      child: Image.network(
        image,
        width: 150.w,
        height: double.maxFinite,
        fit: BoxFit.cover,
      ),
    );
  }
}
