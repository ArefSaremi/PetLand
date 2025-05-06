import 'package:flutter_application_2/core/constants/pet_names.dart';
import 'package:flutter_application_2/core/models/product_detailes.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

abstract class ProductRepository {
  Future<List<ProductInfo>> fetchProducts(
    Animal animalName,
    RxString selectedCategory,
  );
  Future<List<String>> fetchCategories();
}
