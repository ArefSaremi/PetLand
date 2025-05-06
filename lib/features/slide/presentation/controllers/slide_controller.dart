import 'package:flutter_application_2/core/constants/routs.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/constants/images.dart';
import '../../domain/slide_repository.dart';

class SlideController extends GetxController {
  final SlideRepository repository;
  SlideController({required this.repository});
  RxInt index = 0.obs;
  GetStorage box = GetStorage();
  final List<String> images = [imageCat, imageDog, imageBird];
  List<String> text = [
    'انواع محصولات \n برای گربه',
    'انواع محصولات \n برای سگ',
    'انواع محصولات \n برای پرنده',
  ];
  void nextFunction() {
    if (index >= images.length - 1) {
      Get.toNamed(AppRoutes().selectPet);
      repository.isSlideDisplayed();
    } else {
      index.value++;
    }
  }
}
