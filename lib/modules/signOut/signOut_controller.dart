import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yobills/shared/auth/auth_controller.dart';

class SignOutController {
  final authController = AuthController();

  Future<void> signOut(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      await _googleSignIn.signOut();
      authController.setUser(context, null);
    } catch (error) {
      print(error);
    }
  }
}
