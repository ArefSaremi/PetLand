import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/cart/presentation/widgets/buy_button_widget.dart';
import 'package:flutter_application_2/core/constants/colors.dart';
import 'package:flutter_application_2/core/constants/text_style.dart';
import 'package:flutter_application_2/core/utils/number_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsScreen extends GetView<ProductDetailsController> {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: yellow,
        foregroundColor: red,
        title: Text('مشخصات محصول'),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 24.h,
                    children: [
                      Container(
                        color: white,
                        child: Image.network(
                          controller.image,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.4,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(child: Text(controller.name, style: infoTS)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('قیمت:', style: titleTS),
                          Text(
                            '${persianPriceFormatter(controller.price.toInt())} تومان',
                            style: titleDTS,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('توضیحات:', style: titleTS),
                          SizedBox(height: 8),
                          Text(
                            controller.description,
                            style: titleDTS,
                            softWrap: true,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: red,
              height: 100,
              child: BuyButtonWidget(productid: controller.productId),
            ),
          ],
        ),
      ),
    );
  }
}
