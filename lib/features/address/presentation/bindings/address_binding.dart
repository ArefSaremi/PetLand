import 'package:flutter_application_2/features/address/data/address_repository_impl.dart';
import 'package:get/get.dart';

import '../controllers/address_controller.dart';

class AddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressController(repository: AddressRepositoryImpl()));
  }
}
