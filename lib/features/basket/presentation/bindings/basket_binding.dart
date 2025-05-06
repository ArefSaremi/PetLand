import 'package:flutter_application_2/features/basket/data/basket_repository_impl.dart';
import 'package:get/get.dart';

import '../controllers/basket_controller.dart';

class BasketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BasketController>(
      () => BasketController(repository: BasketRepositoryImpl()),
    );
  }
}
