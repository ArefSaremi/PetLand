import 'package:flutter_application_2/core/constants/storage_key.dart';
import 'package:get_storage/get_storage.dart';
import '../../domain/models/cart_model.dart';
import '../../domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  GetStorage storage = GetStorage();

  @override
  Future<CartModel> getCart() async {
    final data = storage.read(StorageKey.cartKey);
    if (data != null) {
      return CartModel(products: data);
    }
    return CartModel(products: {});
  }

  @override
  Future<void> saveCart(CartModel cart) async {
    await storage.write(StorageKey.cartKey, cart.products);
  }
}
