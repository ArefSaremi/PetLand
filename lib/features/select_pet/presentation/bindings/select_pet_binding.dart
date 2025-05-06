import 'package:get/get.dart';
import '../controllers/select_pet_controller.dart';

class SelectPetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectPetController());
  }
}
