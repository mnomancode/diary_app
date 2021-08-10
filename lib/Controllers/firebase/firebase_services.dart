import 'package:google_sign_in/google_sign_in.dart' as google;
import 'package:firebase_auth/firebase_auth.dart' as auth;

class FirebaseServices {
  final google.GoogleSignIn _signInUser = google.GoogleSignIn();
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  Future<String?> googleSignInProcess() async {
    try {
      final google.GoogleSignInAccount? account = await _signInUser.signIn();
      final google.GoogleSignInAuthentication? googleSignInAuthentication =
          await account!.authentication;
      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
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
