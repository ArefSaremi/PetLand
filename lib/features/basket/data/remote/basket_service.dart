import 'package:flutter_application_2/features/basket/data/remote/basket_storage.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/constants/supabase_constants.dart';
import '../../../../core/models/product_detailes.dart';

class BasketService extends GetConnect {
  final SupabaseClient supabase = Supabase.instance.client;
  int? ordid;

  Future<List<ProductInfo>> fetchProducts(List<String> productIds) async {
    try {
      final response = await supabase
          .from(SupabaseConstants.productsTable)
          .select(
            '${SupabaseConstants.productId}, ${SupabaseConstants.productName}, ${SupabaseConstants.description}, ${SupabaseConstants.price}, ${SupabaseConstants.animalId}, ${SupabaseConstants.productTypeId},${SupabaseConstants.imageUrl}, ${SupabaseConstants.animalsTable}!inner(${SupabaseConstants.animalName}), ${SupabaseConstants.productTypesTable}!inner(${SupabaseConstants.productTypeName})',
          )
          .filter(SupabaseConstants.productId, 'in', productIds);

      final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
        response,
      );

      return data.map((item) => _mapToProduct(item)).toList();
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }

  String? getUid() {
    final user = supabase.auth.currentUser;
    return user?.id;
  }

  ProductInfo _mapToProduct(Map<String, dynamic> data) {
    return ProductInfo(
      productId: data[SupabaseConstants.productId],
      name: data[SupabaseConstants.productName],
      description: data[SupabaseConstants.description],
      price: data[SupabaseConstants.price].toDouble(),
      image: data[SupabaseConstants.imageUrl],
    );
  }

  Future<void> processOrder(
    String uid,
    RxList<ProductInfo> products,
    List<String> productIds,
    Map<String, dynamic> cart,
    RxDouble totalPriceDouble,
  ) async {
    await createOrder(uid, totalPriceDouble);
    // get price by productids
    Map<int, double> prices = products.asMap().map((index, product) {
      return MapEntry(product.productId, product.price);
    });
    // add products to order_items
    for (int productId in productIds.map(int.parse)) {
      double? price = prices[productId];
      final quantity = cart[productId.toString()];
      if (price != null) {
        await addProductToOrderItem(
          productId: productId,
          quantity: quantity,
          price: price,
          priceByQuantity: price * quantity,
        );
      }
    }
  }

  Future createOrder(String userId, RxDouble totalPriceDouble) async {
    final x =
        await supabase
            .from(SupabaseConstants.orders)
            .insert({
              SupabaseConstants.userId: userId,
              SupabaseConstants.totalAmount: totalPriceDouble.value,
              SupabaseConstants.status: 'Pending',
            })
            .select(SupabaseConstants.orderid)
            .single();
    ordid = await x[SupabaseConstants.orderid];
    BasketStorage().saveOrderId(ordid!);
  }

  Future<void> addProductToOrderItem({
    required int productId,
    required int quantity,
    required double price,
    required double priceByQuantity,
  }) async {
    await supabase.from(SupabaseConstants.orderItems).upsert([
      {
        SupabaseConstants.orderid: ordid!,
        SupabaseConstants.productId: productId,
        SupabaseConstants.quantity: quantity,
        SupabaseConstants.price: price,
        SupabaseConstants.total: priceByQuantity,
      },
    ]);
  }
}
