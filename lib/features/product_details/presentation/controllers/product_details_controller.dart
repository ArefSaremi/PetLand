import 'package:get/get.dart';

import '../../../../core/models/product_detailes.dart';

class ProductDetailsController extends GetxController {
  late final ProductInfo dtoo;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    dtoo = args as ProductInfo;
  }

  int get productId => dtoo.productId;
  String get description => dtoo.description;
  String get image => dtoo.image;
  String get name => dtoo.name;
  double get price => dtoo.price;
}
