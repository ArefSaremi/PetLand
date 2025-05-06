import 'package:flutter_application_2/features/googleSignIn/data/remote/google_sign_in_service.dart';
import 'package:flutter_application_2/features/googleSignIn/domain/google_sign_in_repository.dart';

class GoogleSignInRepositoryImpl implements GoogleSignInRepository {
  final _service = GoogleSignInService();

  @override
  Future<void> googleSignIn() {
    return _service.googleSignIn();
  }
}
