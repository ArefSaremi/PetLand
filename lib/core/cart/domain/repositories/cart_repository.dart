import '../models/cart_model.dart';

abstract class CartRepository {
  Future<CartModel> getCart();
  Future<void> saveCart(CartModel cart);
}
