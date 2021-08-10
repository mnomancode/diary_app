import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart' as core;

class FirebaseServices {
  final GoogleSignIn _signInUser = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String?> googleSignInProcess() async {
    try {
      final GoogleSignInAccount? account = await _signInUser.signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await account!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication!.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await _auth.signInWithCredential(credential);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _signInUser.signOut();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
