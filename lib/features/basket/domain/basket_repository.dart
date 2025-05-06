import 'package:flutter_application_2/core/models/product_detailes.dart';
import 'package:get/get.dart';

abstract class BasketRepository {
  Future<List<ProductInfo>> fetchProducts(List<String> productIds);
  Map<String, dynamic> getData();
  String? getUid();
  Future<void> processOrder(
    String uid,
    RxList<ProductInfo> products,
    List<String> productIds,
    Map<String, dynamic> cart,
    RxDouble totalPriceDouble,
  );
}
