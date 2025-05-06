import 'package:flutter_application_2/features/googleSignIn/domain/google_sign_in_repository.dart';
import 'package:get/get.dart';
import '../../../../core/constants/routs.dart';

class GoogleSignInController extends GetxController {
  final GoogleSignInRepository repository;

  GoogleSignInController({required this.repository});

  Future<void> signIn() async {
    try {
      await repository.googleSignIn();
      Get.toNamed(AppRoutes().basket);
    } catch (e) {
      print('Login error: $e');
    }
  }
}
