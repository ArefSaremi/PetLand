import 'package:flutter_application_2/core/constants/pet_names.dart';
import 'package:flutter_application_2/core/constants/routs.dart';
import 'package:get/get.dart';

class SelectPetController extends GetxController {
  void choosePet(Animal pet) {
    Get.toNamed(AppRoutes().product, arguments: pet);
  }
}
