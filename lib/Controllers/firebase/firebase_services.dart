import 'package:google_sign_in/google_sign_in.dart' as google;
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:googleapis/drive/v3.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart'
    as google_drive;

class FirebaseServices {
  final google.GoogleSignIn _signInUser = google.GoogleSignIn(
    scopes: <String>[DriveApi.driveScope],
  );
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
      // print(_auth.signInWithCredential(credential));
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

  Future<void> load() async {
    // /*
    // site to enable Publishing Status to testing account
    // https://console.cloud.google.com/apis/credentials/consent?project=diary-app-d0efe

    // site to enable Drive API to testing account
    // https://flutter.dev/docs/development/data-and-backend/google-apis

    // written tutorial:
    // https://betterprogramming.pub/the-minimum-guide-for-using-google-drive-api-with-flutter-9207e4cb05ba
    // */

    final google.GoogleSignIn _signInUser = google.GoogleSignIn(
      scopes: <String>[DriveApi.driveScope],
    );
    await _signInUser.signIn();

    final driveClient = (await _signInUser.authenticatedClient())!;

    // ignore: avoid_print
    print('+++********************+++++++Drive client: $driveClient');

    var driveApi = DriveApi(driveClient);
    final Stream<List<int>> mediaStream =
        Future.value([104, 105]).asStream().asBroadcastStream();

    var medias = Media(mediaStream, 2);
    var driveFile = File();
    driveFile.name = 'hollo_World.txt';
    final result = await driveApi.files.create(driveFile, uploadMedia: medias);
    // ignore: avoid_print
    print('result: ${result.name}');
  }
}
