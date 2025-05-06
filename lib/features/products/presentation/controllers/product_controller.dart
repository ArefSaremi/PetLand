import 'package:flutter_application_2/core/constants/pet_names.dart';
import 'package:flutter_application_2/core/constants/routs.dart';
import 'package:flutter_application_2/features/products/domain/repositories/product_repository.dart';
import 'package:get/get.dart';
import '../../../../core/models/product_detailes.dart';
import '../model/category_item.dart';

class ProductController extends GetxController {
  final ProductRepository repository;
  ProductController({required this.repository});
  Animal selectedAnimal = Get.arguments;
  RxList<String> categories = <String>[].obs;
  RxString selectedCategory = ''.obs;
  RxList<ProductInfo> products = <ProductInfo>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getCategories();
    getProducts();
  }

  Future getCategories() async {
    categories.value = await repository.fetchCategories();
    selectedCategory.value = categories.isNotEmpty ? categories[0] : '';
  }

  void getProducts() async {
    products.value = await repository.fetchProducts(
      selectedAnimal,
      selectedCategory,
    );
  }

  List<CategoryItem> get categoryItems =>
      categories.map((category) {
        return CategoryItem(
          name: category,
          isSelected: selectedCategory.value == category,
        );
      }).toList();

  void productDetails(int index) {
    Get.toNamed(AppRoutes().productDetails, arguments: products[index]);
  }
}
