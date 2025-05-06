import 'package:flutter_application_2/core/constants/routs.dart';
import 'package:get/get.dart';
import '../../domain/models/cart_model.dart';
import '../../domain/repositories/cart_repository.dart';

class CartController extends GetxController {
  final CartRepository repository;
  late final cart = CartModel(products: {}).obs;

  CartController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  Future<void> loadCart() async {
    cart.value = await repository.getCart();
  }

  void addProduct(String products) {
    final currentProducts = cart.value.products;

    if (currentProducts.containsKey(products)) {
      currentProducts[products] = currentProducts[products]! + 1;
    } else {
      currentProducts[products] = 1;
    }
    repository.saveCart(CartModel(products: currentProducts));

    cart.value = CartModel(products: currentProducts);
  }

  void reduceProduct(String productId) {
    final currentProducts = cart.value.products;
    if (!currentProducts.containsKey(productId)) return;
    if (currentProducts[productId]! > 1) {
      currentProducts[productId] = currentProducts[productId]! - 1;
    } else {
      currentProducts.remove(productId);
    }
    repository.saveCart(CartModel(products: currentProducts));
    cart.value = CartModel(products: currentProducts);
  }

  RxInt quantity(int productid) {
    int? quantity = cart.value.products['$productid'] as int?;
    if (quantity != null) {
      return quantity.obs;
    }
    return 0.obs;
  }

  void goToBasket() => Get.toNamed(AppRoutes().basket);
}
