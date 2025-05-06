import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/cart/presentation/widgets/app_bar_widget.dart';
import 'package:flutter_application_2/core/cart/presentation/widgets/buy_button_widget.dart';
import 'package:flutter_application_2/core/utils/number_formatter.dart';
import 'package:flutter_application_2/features/products/presentation/controllers/product_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_style.dart';

class ProductScreen extends GetView<ProductController> {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_showCategory(), _showProducts()],
          ),
        ),
      ),
    );
  }

  Obx _showProducts() {
    return Obx(
      () => Expanded(
        child:
            controller.products.isEmpty
                ? Center(child: CircularProgressIndicator(color: red))
                : ListView.separated(
                  itemCount: controller.products.length,
                  separatorBuilder:
                      (context, index) => Divider(color: black, height: 30.h),
                  itemBuilder: (context, index) {
                    var product = controller.products[index];
                    return InkWell(
                      onTap: () {
                        controller.productDetails(index);
                      },
                      child: SizedBox(
                        width: double.maxFinite,
                        height: 180.h,
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
              BuyButtonWidget(productid: productId),
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

  Directionality _showCategory() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 10.0,
          children:
              controller.categoryItems.map((category) {
                return FilterChip(
                  shape: StadiumBorder(side: BorderSide(color: red)),
                  label: Text(
                    category.name,
                    style:
                        category.isSelected
                            ? TextStyle(color: yellow)
                            : TextStyle(color: red),
                  ),
                  selected: category.isSelected,
                  onSelected: (bool selected) {
                    if (selected) {
                      controller.selectedCategory.value = category.name;
                      controller.getProducts();
                    }
                  },
                  selectedColor: red,
                  backgroundColor: yellow,
                  showCheckmark: false,
                );
              }).toList(),
        ),
      ),
    );
  }
}
