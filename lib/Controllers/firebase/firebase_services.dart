import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  final GoogleSignIn _signIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<String?> googleSignInProcess() async {
    try {
      final GoogleSignInAccount? account = await _signIn.signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await account!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication!.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await auth.signInWithCredential(credential);
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<void> signOut() async {
    await auth.signOut();
    await _signIn.signOut();
  }
}
