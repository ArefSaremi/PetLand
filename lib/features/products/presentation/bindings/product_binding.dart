import 'package:flutter_application_2/features/products/data/product_repasitory_impl.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
      () => ProductController(repository: ProductRepositoryImpl()),
    );
  }
}
