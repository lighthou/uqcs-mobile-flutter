import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

String name = 'hello';
String email;
String imageUrl;

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  final FirebaseUser user = await _auth.signInWithCredential(credential);
  assert(user.email != null);
  assert(user.displayName != null);
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);
  name = user.displayName;
  email = user.email;
  imageUrl = user
      .photoUrl; // Only taking the first part of the name, i.e., First Nameif (name.contains(" ")) {   name = name.substring(0, name.indexOf(" "));}

  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle() async {
  await _googleSignIn.signOut();

  print("User Sign Out");
}
