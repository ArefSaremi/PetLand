import 'package:flutter_application_2/core/constants/pet_names.dart';
import 'package:flutter_application_2/core/constants/supabase_constants.dart';
import 'package:flutter_application_2/core/models/product_detailes.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductServie extends GetConnect {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<ProductInfo>> fetchProducts(
    Animal selectedAnimal,
    RxString selectedCategory,
  ) async {
    try {
      final response = await supabase
          .from(SupabaseConstants.productsTable)
          .select(
            '${SupabaseConstants.productId}, ${SupabaseConstants.productName}, ${SupabaseConstants.description}, ${SupabaseConstants.price}, ${SupabaseConstants.animalId}, ${SupabaseConstants.productTypeId},${SupabaseConstants.imageUrl}, ${SupabaseConstants.animalsTable}!inner(${SupabaseConstants.animalName}), ${SupabaseConstants.productTypesTable}!inner(${SupabaseConstants.productTypeName})',
          )
          .eq(
            '${SupabaseConstants.animalsTable}.${SupabaseConstants.animalName}',
            selectedAnimal.name,
          )
          .eq(
            '${SupabaseConstants.productTypesTable}.${SupabaseConstants.productTypeName}',
            selectedCategory.value,
          );

      final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
        response,
      );

      return data.map((item) => _mapToProduct(item)).toList();
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }

  ProductInfo _mapToProduct(Map<String, dynamic> data) {
    return ProductInfo(
      productId: data['productid'],
      name: data['productname'],
      description: data['description'],
      price: data['price'],
      image: data['image_url'],
    );
  }

  Future<List<String>> fetchCategories() async {
    try {
      final response = await supabase
          .from('product_types')
          .select('producttypename');
      List<String> categories = List<String>.from(
        response.map((e) => e['producttypename']),
      );
      return categories;
    } catch (e) {
      print('Error fetching categories: $e');
      return [];
    }
  }
}
