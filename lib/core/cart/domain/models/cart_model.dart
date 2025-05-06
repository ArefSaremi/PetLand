class CartModel {
  final Map<String, dynamic> products; // key: productId, value: quantity

  CartModel({required this.products});

  int get itemCount => products.keys.length;
}
