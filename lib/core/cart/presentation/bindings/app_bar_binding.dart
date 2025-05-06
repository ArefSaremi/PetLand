import 'package:get/get.dart';
import '../../data/repositories/cart_repository_impl.dart';
import '../controllers/cart_controller.dart';

class AppBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
      () => CartController(repository: CartRepositoryImpl()),
    );
  }
}
