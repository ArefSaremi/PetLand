import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GoogleSignInService extends GetConnect {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> googleSignIn() async {
    if (kIsWeb) {
      await supabase.auth.signInWithOAuth(OAuthProvider.google);
    } else {
      const webClientId =
          '374958549922-ta6s08juot6qt1btr47fli2dk7as4tu7.apps.googleusercontent.com';
      const iosClientId =
          '374958549922-1j94f2erac2s2ka1okf5qcl8v52800j6.apps.googleusercontent.com';

      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: iosClientId,
        serverClientId: webClientId,
      );

      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;

      final accessToken = googleAuth?.accessToken;
      final idToken = googleAuth?.idToken;

      if (accessToken == null || idToken == null) {
        throw Exception('Missing Google Auth tokens');
      }

      await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
    }
  }
}
