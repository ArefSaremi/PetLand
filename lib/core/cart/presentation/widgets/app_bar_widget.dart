import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/constants/icons.dart';
import 'package:flutter_application_2/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../utils/number_formatter.dart';
import '../controllers/cart_controller.dart';

class AppBarWidget extends GetView<CartController>
    implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppBar(
        toolbarHeight: 54.h,
        backgroundColor: yellow,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: FittedBox(
          child: Row(
            children: [
              Icon(MyIcons.logo, size: 52.sp, color: red),
              Text('پت\n لند', style: titleTS),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: controller.goToBasket,
            child: Stack(
              children: [
                Icon(Icons.local_mall_outlined, size: 40.sp, color: red),
                if (controller.cart.value.itemCount > 0)
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: red,
                      child: Text(
                        persianNumberFormatter(controller.cart.value.itemCount),
                        style: itemCountCartTS,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Icon(Icons.account_circle_outlined, size: 44.sp, color: red),
        ),
      ),
    );
  }
}
