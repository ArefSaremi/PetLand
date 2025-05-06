import 'package:flutter_application_2/core/models/product_detailes.dart';
import 'package:flutter_application_2/features/basket/domain/basket_repository.dart';
import 'package:get/get.dart';
import 'remote/basket_service.dart';
import 'remote/basket_storage.dart';

class BasketRepositoryImpl implements BasketRepository {
  final _service = BasketService();
  final _storage = BasketStorage();
  @override
  Future<List<ProductInfo>> fetchProducts(List<String> productIds) {
    return _service.fetchProducts(productIds);
  }

  @override
  Map<String, dynamic> getData() {
    return _storage.getData();
  }

  @override
  String? getUid() {
    return _service.getUid();
  }

  @override
  Future<void> processOrder(
    String uid,
    RxList<ProductInfo> products,
    List<String> productIds,
    Map<String, dynamic> cart,
    RxDouble totalPriceDouble,
  ) {
    return _service.processOrder(
      uid,
      products,
      productIds,
      cart,
      totalPriceDouble,
    );
  }
}
