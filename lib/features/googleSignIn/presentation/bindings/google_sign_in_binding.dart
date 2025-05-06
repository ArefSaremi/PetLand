import 'package:flutter_application_2/features/googleSignIn/data/google_sign_in_repository_impl.dart';
import 'package:get/get.dart';
import '../controllers/google_sign_in_controller.dart';

class GoogleSignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GoogleSignInController(repository: GoogleSignInRepositoryImpl()),
    );
  }
}
