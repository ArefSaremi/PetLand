import 'package:flutter_application_2/core/constants/pet_names.dart';
import 'package:flutter_application_2/core/models/product_detailes.dart';
import 'package:flutter_application_2/features/products/data/remote/product_servies.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final _service = ProductServie();
  @override
  Future<List<ProductInfo>> fetchProducts(
    Animal selectedAnimal,
    RxString selectedCategory,
  ) {
    return _service.fetchProducts(selectedAnimal, selectedCategory);
  }

  @override
  Future<List<String>> fetchCategories() {
    return _service.fetchCategories();
  }
}
