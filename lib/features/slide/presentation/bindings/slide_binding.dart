import 'package:flutter_application_2/features/slide/data/slide_repositoryimpl.dart';
import 'package:get/get.dart';

import '../controllers/slide_controller.dart';

class SlideBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SlideController(repository: SlideRepositoryimpl()));
  }
}
