import 'package:flutter_application_2/core/constants/routs.dart';
import 'package:flutter_application_2/features/basket/domain/basket_repository.dart';
import 'package:get/get.dart';
import '../../../../core/cart/domain/models/cart_model.dart';
import '../../../../core/models/product_detailes.dart';

class BasketController extends GetxController {
  BasketRepository repository;
  BasketController({required this.repository});
  List<String> productIds = [];
  RxList<ProductInfo> products = <ProductInfo>[].obs;
  Map<String, dynamic> cart = {};
  RxBool isCartEmpty = false.obs;

  @override
  void onInit() {
    super.onInit();
    getFromStorage();
  }

  void getFromStorage() async {
    final data = repository.getData();
    productIds = data.keys.toList();
    if (data != {}) {
      products.value = await repository.fetchProducts(productIds);
      cart = CartModel(products: data).products;
      if (data.isEmpty) {
        isCartEmpty.value = true;
      }
    }
  }

  RxDouble get totalPriceDouble {
    return products.fold(0.0.obs, (sum, product) {
      String id = product.productId.toString();
      double price = product.price;
      //get quantity from cart by product id
      int many = cart[id] ?? 0;
      double basketTotal = sum.value + (price * many);
      double basketTotalRounded = double.parse(basketTotal.toStringAsFixed(2));
      return basketTotalRounded.obs;
    });
  }

  void loadBasketItems() async {
    final uid = repository.getUid();
    if (uid != null) {
      await repository.processOrder(
        uid,
        products,
        productIds,
        cart,
        totalPriceDouble,
      );
      Get.toNamed(AppRoutes().address);
    } else {
      Get.toNamed(AppRoutes().googleSignIn);
    }
  }

  void goToProductDetails(int index) {
    Get.toNamed(AppRoutes().productDetails, arguments: products[index]);
  }
}
