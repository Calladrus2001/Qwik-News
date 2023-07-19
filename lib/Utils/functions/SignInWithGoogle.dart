import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<User?> signUpWithGoogle() async {
  try {
    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    if (googleSignInAccount == null) return null;

    final GoogleSignInAuthentication googleSignInAuth = await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuth.accessToken,
      idToken: googleSignInAuth.idToken,
    );

    final UserCredential authResult = await _auth.signInWithCredential(credential);
    final User? user = authResult.user;

    if (user != null && authResult.additionalUserInfo!.isNewUser) {
      await _createUserAccount(user);
    }

    return user;
  } catch (e) {
    print('Error during Google Sign-Up: $e');
    return null;
  }
}

Future<void> _createUserAccount(User user) async {

}
