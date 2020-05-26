import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String userName = '';
String email = '';
String phone = '';
String uid = '';

Future<String> signInWithGoogle() async{
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  userName = user.displayName;
  email = user.email;
  phone = user.phoneNumber;
  uid = user.uid;

  assert (!user.isAnonymous);
  assert (await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  print('signInWithGoogle succeeded: $userName');
  print('signInWithGoogle account: $email');
  print('signInWithGoogle uid: $uid');
  print(getUid());
  print(getUid().runtimeType);
}

void signOutGoogle() async{
  await googleSignIn.signOut();
  print("User Sign Out");
}

String getUserName(){
  return userName;
}

String getEmail(){
  return email;
}

String getPhone(){
  return phone;
}

String getUid(){
  return uid;
}
